class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.string :name
    	t.datetime :date_of_station

      t.timestamps
    end
  end
end
