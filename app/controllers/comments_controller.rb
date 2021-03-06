class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]
  before_action :set_project_options, only: %i[ index new edit ]
  before_action :set_vessel_options, only: %i[ index new edit ]
  before_action :set_category_options, only: %i[ index new edit ]

  def index
    if params[:selected_project].present?
      @comments = Comment.where(project_id: params[:selected_project].to_i)
    else
      @comments = Comment.where(project_id: current_user.projects.map{ |u| u.id})
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

    def set_vessel_options
      @vessel_options = Vessel.where(project_id: current_user.projects.map{ |u| u.id}).map{ |u| [ u.hull_number, u.id ]}.uniq { |x| x[0] }
    end

    def set_category_options
      @category_options = Category.all
    end

    def comment_params
      params.require(:comment).permit(:title, :body, :user_id, :project_id, :category_id, :status, :closing_date, :vessel_id, :image)
    end
end
