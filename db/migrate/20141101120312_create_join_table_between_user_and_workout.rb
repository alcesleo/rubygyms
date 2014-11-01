class CreateJoinTableBetweenUserAndWorkout < ActiveRecord::Migration
  def change
    create_join_table :users, :workouts
  end
end
