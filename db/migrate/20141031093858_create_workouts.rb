class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :title, null: false
      t.references :club, index: true

      t.timestamps
    end
  end
end
