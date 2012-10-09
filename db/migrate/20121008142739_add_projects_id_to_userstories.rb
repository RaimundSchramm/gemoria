class AddProjectsIdToUserstories < ActiveRecord::Migration
  def change
    add_column :userstories, :project_id, :integer
    add_index :userstories, :project_id
  end
end
