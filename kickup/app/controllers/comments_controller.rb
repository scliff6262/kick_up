class CommentsController < ApplicationController

  def create
    @comment = Comment.new(content: params[:comment][:content], user_id: current_user.id, event_id: params[:event_id])
    if @comment.save
      redirect_to event_path(@comment.event)
    else
      render "comments/new"
    end
  end
end
