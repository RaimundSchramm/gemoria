class AddUserstoryIdToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :userstory_id, :integer
    add_index :tasks, :userstory_id
  end
end
