class UsersController < ApplicationController
    protect_from_forgery
  

    def user   #homepage
      render "/home"

    end

    def new_sign_up  # creating users
      @user = User.new(user_params)
        if @user.save
          session[:user_id] = @user.id
          redirect_to '/users/:id'
        else
          redirect_to '/login'
        end
    end

    def show
      @vehicles = current_user.vehicles
    end

    def login # route to logging user in
      #redirect_to '/login'
    end

    def logout  #signing a user out
      session.delete :user_id
      redirect_to "/home"
    end


    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end