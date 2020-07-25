class SessionsController < ApplicationController
    
    def google
        
        @user = User.find_or_create_by(email: auth["info"]["email"]) do |user|
            user.username = auth["info"]["first_name"]
            user.password = SecureRandom.hex(10)
        end
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to '/'
        end
    end


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

    private
 
    def auth
        request.env['omniauth.auth']
    end
end