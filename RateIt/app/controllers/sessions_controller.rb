class SessionsController < ApplicationController
    protect_from_forgery

  def new
  end

  def create #Logged user in redirected to user page
    if auth_hash = request.env["omniauth.auth"]
      # They logged into oauth
      oauth_email = request.env["omniauth.auth"]["info"]["email"]
     if @user = User.find_by(:email => oauth_email)
      #raise "existing user".inspect
      session[:user_id] = @user.id
      redirect_to new_vehicle_path
     else
      user = User.new(:email => oauth_email, :password => SecureRandom.hex, :username => @user.name)
      if user.save
       session[:user_id] = @user.id
       redirect_to vehicle_path
      else
        raise user.errors.full_messages.inspect
      end
     end
    else
      #normal login with username and password
     @user = User.find_by(username: params[:user][:username])
     if @user.try(:authenticate, params[:user][:password])
       session[:user_id] = @user.id
       redirect_to '/users/:id'
      else
       render '/users/show'
      end
    end
  end

  def destroy
    reset_session
    redirect_to login_path
  end

  private
  def auth
    request.env['omniauth.auth']
  end
end

