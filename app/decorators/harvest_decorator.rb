class HarvestDecorator < Draper::Decorator
  delegate_all

  def entries_by_client client, start_date, end_date
    projects_by_client(client).map do |project|
      entries_by_project(project, start_date, end_date)
    end.flatten
  end

  def entries_by_project project, start_date, end_date
    reports.time_by_project(project, start_date, end_date)
  end

  def entries_by_task client, start_date, end_date, task_id
    entries_by_client(client, start_date, end_date).map do |entry|
      task_id.to_i == entry.task_id ? entry : nil
    end.compact
  end

  def tasks_by_client client
    projects = self.projects_by_client(client)
    tasks_by_projects(projects)
  end

  def tasks_by_projects projects
    unless projects.is_a? Array
      projects = [projects]
    end

    tasks_ids = tasks_ids_by_projects(projects)
    tasks_by_ids(tasks_ids)
  end

  def projects_by_client client
    self.projects.all(nil, :client => client.harvest_client_id)
  end

  def client_has_project? client, project_id
    projects_by_client(client).map do |project|
      project.id == project_id
    end.any?
  end

  def client_has_task? client, task_id
    tasks_by_client(client).map do |task|
      task.id == task_id.to_i
    end.any?
  end

  private

  def tasks_ids_by_projects projects
    tasks_ids = []
    projects.each do |project|
      task_assignments.all(project).each do |task_assignment|
        tasks_ids << task_assignment.task_id
      end
    end
    tasks_ids
  end

  def tasks_by_ids tasks_ids
    tasks.all.map do |task|
      tasks_ids.include? (task["id"]) ? task : nil
    end.compact
  end

end
