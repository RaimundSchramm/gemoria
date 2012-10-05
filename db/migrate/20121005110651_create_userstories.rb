class CreateUserstories < ActiveRecord::Migration
  def change
    create_table :userstories do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
