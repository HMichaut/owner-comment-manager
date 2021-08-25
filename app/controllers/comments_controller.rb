class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]
  before_action :set_project_options, only: %i[ index new edit ]

  def index
    if params[:selected_project].present?
      @comments = Comment.where(project_id: params[:selected_project].to_i)
    else
      @comments = Comment.all
    end
  end

  def show
    @replies = @comment.replies
  end

  def new
    @comment = Comment.new
  end

  def edit
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

    def set_project_options
      @project_options = current_user.projects.map{ |u| [ u.reference, u.id ]}.uniq { |x| x[0] }
    end

    def comment_params
      params.require(:comment).permit(:title, :body, :user_id, :project_id)
    end
end
