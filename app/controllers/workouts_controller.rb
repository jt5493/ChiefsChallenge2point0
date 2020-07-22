class WorkoutsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        @user = User.find_by_id(session[:user_id])
        @workouts = @user.workouts
    end

    def new
        @workout = Workout.new
    end

    def create

    end
end
