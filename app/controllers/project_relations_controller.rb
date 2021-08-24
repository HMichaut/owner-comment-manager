class ProjectRelationsController < ApplicationController
  before_action :set_project_relation, only: %i[ show edit update destroy ]

  def index
    @project_relations = ProjectRelation.all
  end

  def show
  end

  def new
    @project_relation = ProjectRelation.new
    @project_options = Project.all.map{ |u| [ u.reference, u.id ]}.uniq { |x| x[0] }
    @user_options = User.all.map{ |u| [ u.username, u.id ]}.uniq { |x| x[0] }
  end

  def edit
    @project_options = Project.all.map{ |u| [ u.reference, u.id ]}.uniq { |x| x[0] }
    @user_options = User.all.map{ |u| [ u.username, u.id ]}.uniq { |x| x[0] }
  end

  def create
    @project_relation = ProjectRelation.new(project_relation_params)
    if @project_relation.save
      redirect_to @project_relation
    else
      render :new
    end
  end

  def update
    if @project_relation.update(project_relation_params)
      redirect_to @project_relation
    else
      render :edit
    end
  end

  def destroy
    @project_relation.destroy
  end

  private
    def set_project_relation
      @project_relation = ProjectRelation.find(params[:id])
    end

    def project_relation_params
      params.require(:project_relation).permit(:user_id, :project_id)
    end
end
