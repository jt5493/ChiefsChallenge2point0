class AddExercisesDoneWorkouts < ActiveRecord::Migration[6.0]
  def change
    add_column :workouts, :exercises_done, :string
  end
end
