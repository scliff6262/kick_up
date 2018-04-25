class StaticController < ApplicationController
  skip_before_action :require_login, only: [:welcome]

  def welcome
    if !!current_user
      redirect_to user_path(current_user)
    else
      render "static/welcome", layout: false if !current_user
    end
  end
end
