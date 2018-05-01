class EventsController < ApplicationController
  before_action :find_event, only: [:show, :edit, :update, :destroy]

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
  end

  def edit
    unless @event.organizer == current_user
      flash[:message1] = "Only the organizer can edit this event."
      redirect_to event_path(@event)
    end
  end

  def update
    @event.assign_attributes(event_params)
    @event.event_time = "#{params[:event]["event_time(4i)"]}:#{params[:event]["event_time(5i)"]}"
    if @event.save
      redirect_to event_path(@event)
    else
      render "events/edit"
    end
  end

  def destroy
    if current_user.organized_events.include?(@event)
      @event.destroy
      redirect_to user_path(current_user)
    else
      redirect_to event_path(@event)
    end
  end

  private

  def find_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :zip_code, :skill_level, :date, :address, :event_type)
  end
end
