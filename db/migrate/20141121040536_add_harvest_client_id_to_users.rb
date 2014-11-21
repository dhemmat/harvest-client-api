class AddHarvestClientIdToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :harvest_client_id, :string
  end
end
