class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]

  def index
    @comments = Comment.all
  end

  def show
  end

  def new
    @comment = Comment.new
    @project_options = Project.all.map{ |u| [ u.reference, u.id ]}.uniq { |x| x[0] }
  end

  def edit
    @project_options = Project.all.map{ |u| [ u.reference, u.id ]}.uniq { |x| x[0] }
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to @comment
    else
      render :new
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to @comment
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:title, :body, :user_id, :project_id)
    end
end
