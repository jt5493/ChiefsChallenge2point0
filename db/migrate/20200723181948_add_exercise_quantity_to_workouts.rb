class AddExerciseQuantityToWorkouts < ActiveRecord::Migration[6.0]
  def change
    add_column :workouts, :exercise_quantity, :integer
  end
end
