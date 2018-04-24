class StaticController < ApplicationController
  skip_before_action :require_login, only: [:welcome]

  def welcome
    redirect_to user_path(current_user) if !!current_user
    render layout: false
  end
end
