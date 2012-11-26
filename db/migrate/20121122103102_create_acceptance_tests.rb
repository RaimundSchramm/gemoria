class CreateAcceptanceTests < ActiveRecord::Migration
  def change
    create_table :acceptance_tests do |t|
      t.references :userstory
      t.text :description

      t.timestamps
    end
    add_index :acceptance_tests, :userstory_id
  end
end
