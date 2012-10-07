class AddCompleteToUserstories < ActiveRecord::Migration
  def change
    add_column :userstories, :complete, :boolean
  end
end
