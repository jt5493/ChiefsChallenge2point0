class UsersController < ApplicationController

    def index
        @users = User.all
        if params[:search] && !params[:search].empty?
            @users = @users.search(params[:search].downcase)
        end
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id 
            redirect_to new_workout_path
        else
            render :new
        end

    end

    def show
        redirect_if_not_logged_in
        @user = User.find_by_id(params[:id])
        redirect_to '/' if !@user
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end

end
