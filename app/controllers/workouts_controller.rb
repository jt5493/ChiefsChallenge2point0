class WorkoutsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        if params[:user_id]
            if @user = User.find_by_id(params[:user_id])
                @workouts = @user.workouts.most_points
            else
                redirect_to users_path
            end
        else
            redirect_to users_path
        end        
    end

    def new
        @workout = Workout.new
        @exercises = Exercise.all
    end

    def create
        
        @workout = current_user.workouts.build(workout_params)
        @workout.points_total = points_sum
        if @workout.save
            
            redirect_to workout_path(@workout)
        else
            render :new
        end
    end

    def show
        
        @workout = Workout.find_by_id(params[:id])

    end

    private

    def workout_params
        params.require(:workout).permit(
            :workout_date,
            :points_total,
            :exercises_done,
            :exercise_quantity,
            :exercise_ids => [])
    end

end
