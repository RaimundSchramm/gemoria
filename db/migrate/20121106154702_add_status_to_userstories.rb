class AddStatusToUserstories < ActiveRecord::Migration
  def change
    add_column :userstories, :status, :string
  end
end
