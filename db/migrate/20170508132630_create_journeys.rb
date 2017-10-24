class CreateJourneys < ActiveRecord::Migration
  def change
    create_table :journeys do |t|
    	t.integer :count_of_seats
    	t.string :place_of_departure
    	t.datetime :date_of_departure
    	t.string :place_of_arrive
    	t.datetime :date_of_arrive

      t.timestamps
    end
  end
end
