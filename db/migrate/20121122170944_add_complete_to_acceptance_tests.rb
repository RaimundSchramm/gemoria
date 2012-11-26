class AddCompleteToAcceptanceTests < ActiveRecord::Migration
  def change
    add_column :acceptance_tests, :complete, :boolean
  end
end
