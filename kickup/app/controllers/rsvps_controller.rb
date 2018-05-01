class RsvpsController < ApplicationController

  def index
    @event = Event.find(params[:event_id])
    @rsvps = @event.rsvps
    if @event.organizer != current_user
      flash[:message1] = "Only the organizer can view attendees."
      redirect_to event_path(@event)
    end
  end

  def new
    @event = Event.find_by(id: params[:event_id])
    if @event.users.include?(current_user)
      flash[:message1] = "You already are attending this kickup!"
      redirect_to event_path(@event)
    else
      render :new
    end

  end

  def create
    @rsvp = Rsvp.new(comment: rsvp_params[:comment], event_id: rsvp_params[:event_id])
    @rsvp.user_id = current_user.id
    if @rsvp.save
      redirect_to user_rsvp_path(current_user, @rsvp)
    else
      render 'rsvp/new'
    end
  end

  def show
    @rsvp = Rsvp.find(params[:id])
    if params[:user_id]
      @user = current_user
    else
      @event = @rsvp.event
    end
  end

  def delete
    @rsvp = Rsvp.find(params[:id])
    if @rsvp.user != current_user
      flash[:message3] = "That is not your reservation!"
      redirect_to event_path(@rsvp.event)
    else
      render :delete
    end

  end

  def destroy
    @rsvp = Rsvp.find(params[:id])
    @rsvp.destroy
    redirect_to event_path(params[:event_id])
  end

  private

  def rsvp_params
    params.permit(:comment, :event_id)
  end
end
