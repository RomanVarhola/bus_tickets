class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
    	t.integer :number 

      t.timestamps
    end
  end
end
