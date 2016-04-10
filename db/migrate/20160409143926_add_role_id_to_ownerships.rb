class AddRoleIdToOwnerships < ActiveRecord::Migration
  def change
    add_reference :ownerships, :role, index: true, foreign_key: true
  end
end
