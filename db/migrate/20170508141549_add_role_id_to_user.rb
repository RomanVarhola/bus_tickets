class AddRoleIdToUser < ActiveRecord::Migration
  def change
    add_reference :users, :role, foreign_key: true
  end
end
