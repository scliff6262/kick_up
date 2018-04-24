class RsvpsController < ApplicationController

  def new
    @event = Event.find_by(params[:event_id])
    flash[:message] = "You already are attending this kickup!"
    redirect_to event_path(@event) if @event.users.all.include?(current_user)
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
    @user = current_user
  end

  def edit
  end

  def update
  end

  def delete
    @rsvp = Rsvp.find(params[:id])
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
