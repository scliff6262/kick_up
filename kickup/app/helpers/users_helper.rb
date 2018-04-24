module UsersHelper

  def nearby_events(user)
    ##
  end

  def homepage_or_profile
    if session[:user_id] == @user.id
      render 'users/current_user'
    else
      render 'users/not_current_user'
    end
  end

  def user_skill_level(skill_level)
    case skill_level
    when 1
      "Beginner"
    when 2
      "Some Experience"
    when 3
      "Veteran"
    when 4
      "Highly Competitive"
    end
  end

end
