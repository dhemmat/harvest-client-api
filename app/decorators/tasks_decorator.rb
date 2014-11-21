class TasksDecorator < Draper::Decorator
  delegate_all

  def by_client client
  	projects = harvest.projects.all(nil, :client => client.harvest_client_id)
  	by_projects(projects)
  end

  def by_projects projects
  	unless projects.is_a? Array
  		projects = [projects]
  	end

  	tasks_ids = tasks_ids_by_projects(projects)
  	tasks_by_ids(tasks_ids)
  end

  private

  def tasks_ids_by_projects projects
  	tasks_ids = []
  	projects.each do |p|
      harvest.task_assignments.all(p).each do |ta|
        tasks_ids << ta.task_id
      end
    end
    tasks_ids
  end

  def tasks_by_ids tasks_ids
  	all.map do |t|
	    if tasks_ids.include? (t["id"])
	      t
	    else
	      nil
	    end
	  end.compact
  end

  def harvest
    HarvestLoader.getHarvestInstance
  end

end
