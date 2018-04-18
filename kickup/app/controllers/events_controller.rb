class EventsController < ApplicationController

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.event_time = "#{params[:event]["event_time(4i)"]}:#{params[:event]["event_time(5i)"]}"
    @event.organizer_id = params[:user_id]
    if @event.save
      redirect_to user_event_path(params[:user_id], @event)
    else
      render "events/new"
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:title, :zip_code, :skill_level, :date, :address, :event_type)
  end
end
