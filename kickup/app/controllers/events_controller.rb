class EventsController < ApplicationController

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.event_time = "#{params[:event]["event_time(4i)"]}:#{params[:event]["event_time(5i)"]}"
    @event.organizer_id = current_user.id
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

  private

  def event_params
    params.require(:event).permit(:title, :zip_code, :skill_level, :date, :address, :event_type)
  end
end
