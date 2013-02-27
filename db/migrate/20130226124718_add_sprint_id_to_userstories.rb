class AddSprintIdToUserstories < ActiveRecord::Migration
  def change
    add_column :userstories, :sprint_id, :integer
  end
end
