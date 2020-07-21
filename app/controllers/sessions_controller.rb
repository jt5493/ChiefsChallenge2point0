class SessionsController < ApplicationController
    
    def delete
        session.clear
        redirect_to '/'
    end

    def create
        user = User.find_by(username: params[:user][:username])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id 
            redirect_to user_path(user)
        else
            flash[:message] = "Username or Password was incorect."
            redirect_to "/login"
    end
end