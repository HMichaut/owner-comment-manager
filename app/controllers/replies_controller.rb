class RepliesController < ApplicationController

  def new
    @comment = Comment.find(params[:comment].to_i)
    @reply = Reply.new
  end

  def create
    @reply = Reply.new(reply_params)
    if @reply.save
      redirect_to @reply.comment
    else
      render :new
    end
  end

  private
    def reply_params
      params.require(:reply).permit(:body, :user_id, :comment_id)
    end
end
