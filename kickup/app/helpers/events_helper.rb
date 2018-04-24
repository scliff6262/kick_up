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

  def sort_events_by_date
    Event.all.sort do |a, b|
      Date.strptime(a.date, '%m/%d/%Y') <=> Date.strptime(b.date, '%m/%d/%Y')
    end
  end

  def attend_link
    unless @event.users.include?(current_user)
      link_to "Attend this Kickup", new_event_rsvp_path(@event)
    else
      link_to "Cancel RSVP", event_rsvp_delete_path(@event, find_rsvp_id(@event))
    end
  end

  def organizer_edit
    if @event.organizer_id == current_user.id
      link_to "Edit this Event", edit_event_path(@event)
    end
  end

  def find_rsvp_id(event)
    Rsvp.where(event_id: event.id).where(user_id: current_user.id).ids
  end

  def current_user
    User.find(session[:user_id])
  end

end
