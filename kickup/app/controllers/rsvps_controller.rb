class RsvpsController < ApplicationController

  def new
    @event = params[:event_id]
  end

  def create
    raise params.inspect
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
