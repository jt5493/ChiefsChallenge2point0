class ExercisesController < ApplicationController

    before_action :redirect_if_not_logged_in

    def new
        if params[:workout_id]
            if @workout = Workout.find_by_id(params[:workout_id])
                @exercise = @workout.exercises.build
            end
        else
            @exercise = Exercise.new
            @exercises = Exercise.all
        end
    end

    def create
        @exercise = Exercise.new(exercise_params)
        if @exercise.save
            redirect_to new_workout_path
        else
            render :new
        end

    end

    private

    def exercise_params
        params.require(:exercise).permit(:name, :value, :workout_id)
    end

end
