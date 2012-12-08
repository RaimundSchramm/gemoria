class ChangeDescriptionInUserstories < ActiveRecord::Migration
  def up
    backup = {}
    Userstory.all.each do |us|
      backup[us.id] = us.description
    end

    remove_column :userstories, :description
    add_column :userstories, :description, :text

    backup.each do |us_id, description|
      Userstory.find(us_id).update_attributes(description: description)
    end
  end

  def down
    remove_column :userstories, :description
    add_column :userstories, :description, :string
  end
end
