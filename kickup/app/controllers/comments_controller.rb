class CommentsController < ApplicationController
  before_action :find_comment, only: [:show]

  def create
    @comment = Comment.new(content: params[:comment][:content], user_id: current_user.id, event_id: params[:event_id])
    if @comment.save
      respond_to do |f|
        f.html {redirect_to event_path(@comment.event)}
        f.json {render json: @comment}
      end 
    else
      flash[:message2] = "A comment must include some text!"
      redirect_to event_path(params[:event_id])
    end
  end

  def index
    @event = Event.find(params[:event_id])
    @comments = @event.comments
    render json: @comments
  end

  private

  def find_comment
    @comment = Comment.find(params[:id])
  end
end
