class SessionsController < ApplicationController
    protect_from_forgery

  def new
  end

  def create #Logged user in redirected to user page
    auth_hash = request.env["omniauth.auth"]
      # They logged into oauth
    oauth_email = request.env["omniauth.auth"]["info"]["email"]
      if @user = User.find_by(:email => oauth_email)
       #raise "existing user".inspect
       session[:user_id] = @user.id
       redirect_to user_path(@user.id)
      else
       user = User.new(:email => oauth_email, :password => SecureRandom.hex, :username => oauth_email)
      if user.save
       session[:user_id] = user.id
       redirect_to user_path(@user.id)

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
