class AddRelationToTables < ActiveRecord::Migration
  def change
    add_column :stations, :journey_id, :integer
  	add_column :places, :journey_id, :integer
  	add_column :places, :user_id, :integer
  end
end
