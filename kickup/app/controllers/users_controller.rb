class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  before_action :find_user, only: [:show, :edit, :update]

  def new
    @user = User.new
    redirect_to user_path(current_user) if !!current_user
    render layout: "sessions"
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login_user
      redirect_to user_path(@user)
    else
      render "/users/new", layout: "sessions"
    end
  end

  def show
  end

  def edit
  end

  def update
    @user.assign_attributes(user_params)
    if @user && @user.save
      redirect_to user_path(@user)
    else
      render "/users/edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :zip_code, :level, :phone, :email, :password, :password_confirmation)
  end

  def find_user
    @user = User.find(params[:id])
  end

end
