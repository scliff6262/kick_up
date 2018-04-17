class SessionsController < ApplicationController

  def new #login page
    raise session.inspect
  end

  def create #creating a session
    user = User.find_by(email: session_params[:email])

    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      render 'sessions/new'
    end 
  end

  def destroy #logout
    session.clear if current_user
    redirect_to login_path
  end

  private

  def session_params
    params.require(:user).permit(:email, :password)
  end
end
