class SessionsController < ApplicationController
    def create
      user = User.find_by(username: params[:username]) # Change this line
  
      if user&.authenticate(params[:password])
        session[:user_id] = user.id
        render json: { message: "Logged in successfully!" }, status: :ok
      else
        render json: { error: "Invalid username or password" }, status: :unauthorized
      end
    end
    
    def destroy
      session.delete(:user_id)
      render json: { message: "Logged out successfully!" }, status: :ok
    end
  end
  