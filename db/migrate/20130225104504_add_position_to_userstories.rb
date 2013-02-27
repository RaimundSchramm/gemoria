class AddPositionToUserstories < ActiveRecord::Migration
  def change
    add_column :userstories, :position, :string
  end
end
