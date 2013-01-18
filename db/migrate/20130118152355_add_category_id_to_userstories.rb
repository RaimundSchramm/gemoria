class AddCategoryIdToUserstories < ActiveRecord::Migration
  def change
    add_column :userstories, :category_id, :integer
  end
end
