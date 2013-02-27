class CreateSprints < ActiveRecord::Migration
  def change
    create_table :sprints do |t|
      t.boolean :complete
      t.integer :project_id

      t.timestamps
    end
  end
end
