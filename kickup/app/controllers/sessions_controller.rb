class SessionsController < ApplicationController
skip_before_action :require_login, only: [:new, :create]
  def new #login page
    redirect_to user_path(current_user) if current_user
    render layout: false
  end

  def create #creating a session
    user = User.find_by(email: session_params[:email])

    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else

      render 'sessions/new', layout: false
    end
  end

  def destroy #logout
    session.clear if current_user
    redirect_to root_path
  end

  private

  def session_params
    params.require(:user).permit(:email, :password)
  end
end
