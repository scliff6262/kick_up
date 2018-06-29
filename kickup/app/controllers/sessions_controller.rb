class SessionsController < ApplicationController
skip_before_action :require_login, only: [:new, :create]
  def new #login page
    redirect_to user_path(current_user) if current_user
  end

  def create #creating a session
    if !!params[:provider]
      info = request.env["omniauth.auth"]["info"]
      user = User.find_by(email: info["email"])
      if !!user
        session[:user_id] = user.id
        redirect_to user_path(user)
      else
        random_password = SecureRandom.hex(10)
        @user = User.create(
          first_name: info["name"].split(" ")[0],
          last_name: info["name"].split(" ")[1],
          email: info["email"],
          password: random_password,
          password_confirmation: random_password,
          zip_code:"00000",
          level: 1
        )
        session[:user_id] = @user.id
        render "users/zip_and_level"
      end
    else
      user = User.find_by(email: session_params[:email])

      if user && user.authenticate(session_params[:password])
        session[:user_id] = user.id
        redirect_to user_path(user)
      else
        render 'sessions/new'
      end
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
