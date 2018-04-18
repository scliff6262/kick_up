module EventsHelper

  def friendly_date(mmddyyyy)
    split_date = mmddyyyy.split("/")
    ddmmyyyy = "#{split_date[1]}/#{split_date[0]}/#{split_date[2]}}"
    Date.parse(ddmmyyyy).strftime("%A %B %e, %Y ")
  end

  def skill_level_string(skill_level)
    case skill_level
    when 1
      "Beginners"
    when 2
      "Some Experienced Players"
    when 3
      "Veterans"
    when 4
      "Highly Competitive"
    end
  end

end
