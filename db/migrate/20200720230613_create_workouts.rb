class CreateWorkouts < ActiveRecord::Migration[6.0]
  def change
    create_table :workouts do |t|
      t.date :workout_date
      t.integer :points_total
      t.belongs_to :user, null: false, foreign_key: true
      

      t.timestamps
    end
  end
end
