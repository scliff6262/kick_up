class SessionsController < ApplicationController

  def new #login page
  end

  def create #creating a session
    user = User.find_by(email: session_params[:email])

    if user && user.authenticate(session_params[:password])
      redirect_to user_path(user)
    else
      render 'sessions/new'
    end 
  end

  def destroy #logout
  end

  private

  def session_params
    params.require(:user).permit(:email, :password)
  end
end
