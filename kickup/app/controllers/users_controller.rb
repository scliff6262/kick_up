class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render "/users/new"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.assign_attributes(user_params)
    if @user && @user.save
      redirect_to user_path(@user)
    else
      render "/users/edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :zip_code, :level, :phone, :email)
  end
end
