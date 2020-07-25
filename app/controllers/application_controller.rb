class ApplicationController < ActionController::Base
    
    helper_method :current_user, :logged_in?, :points_sum

    private

    def points_sum
        value_array = @workout.exercises.map do |e|
            e.value
        end
        value_array.sum
    end

    def current_user
        @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!session[:user_id]
    end

    def redirect_if_not_logged_in
        redirect_to '/' if !logged_in?
    end
end
