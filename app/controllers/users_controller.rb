class UsersController < ApplicationController
    

    def create
      user = User.new(user_params)
      if user.save
        # Optionally log the user in after registration
        session[:user_id] = user.id
        render json: { message: "User created successfully!" }, status: :created
      else
        render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
  end