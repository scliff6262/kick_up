class EventsController < ApplicationController

  def index
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.event_time = "#{params[:event]["event_time(4i)"]}:#{params[:event]["event_time(5i)"]}"
    @event.organizer_id = current_user.id
    @event.users << current_user
    if @event.save
      redirect_to event_path(@event)
    else
      render "events/new"
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
    redirect_to event_path(@event) unless @event.organizer == current_user
  end

  def update
    @event = Event.find(params[:id])
    # MUST FIX TIME - EDIT ISSUE
    @event.assign_attributes(event_params)
    if @event.save
      redirect_to event_path(@event)
    else
      render "events/edit"
    end
  end

  def destroy
    @event = Event.find(params[:id])
    if current_user.organized_events.include?(@event)
      @event.destroy
      redirect_to user_path(current_user)
    else
      #error message "this isnt your event!!"
      redirect_to event_path(@event)
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :zip_code, :skill_level, :date, :address, :event_type)
  end
end
