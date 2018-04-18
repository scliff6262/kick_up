module UsersHelper

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
