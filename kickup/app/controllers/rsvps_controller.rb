class RsvpsController < ApplicationController
  before_action :find_rsvp, only: [:show, :delete, :destroy]
  before_action :find_event, only: [:index, :new]


  def index
    rsvps = @event.rsvps
    respond_to do |f|
      f.json {render json: rsvps}
      f.html {render :index}
    end
  end

  def new
    if @event.users.include?(current_user)
      flash[:message1] = "You already are attending this kickup!"
      redirect_to event_path(@event)
    else
      render :new
    end

  end

  def create
    @rsvp = Rsvp.new(comment: rsvp_params[:comment], event_id: rsvp_params[:event_id], user_id: current_user.id)
    redirect_to event_rsvp_path(@rsvp.event, @rsvp) if @rsvp.save
  end

  def show
  end

  def delete
    if @rsvp.user != current_user
      flash[:message3] = "That is not your reservation!"
      redirect_to event_path(@rsvp.event)
    end
  end

  def destroy
    @rsvp.destroy
    redirect_to event_path(params[:event_id])
  end

  private

  def rsvp_params
    params.permit(:comment, :event_id)
  end

  def find_rsvp
    @rsvp = Rsvp.find(params[:id])
  end

  def find_event
    @event = Event.find(params[:event_id])
  end
end
