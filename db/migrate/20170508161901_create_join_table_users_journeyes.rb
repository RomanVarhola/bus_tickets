class CreateJoinTableUsersJourneyes < ActiveRecord::Migration
  def change
    create_join_table :users, :journeys do |t|
      t.index [:user_id, :journey_id]
      t.index [:journey_id, :user_id]
    end
  end
end
