class VesselsController < ApplicationController
  before_action :set_vessel, only: %i[ show edit update destroy ]
  before_action :set_project_options, only: %i[ index new edit ]

  def index
    @vessels = Vessel.where(project_id: current_user.projects.map{ |u| u.id})
  end

  def show
  end

  def new
    @vessel = Vessel.new
  end

  def edit
  end

  def create
    @vessel = Vessel.new(vessel_params)
    if @vessel.save
      redirect_to @vessel
    else
      render :new
    end
  end

  def update
    if @vessel.update(vessel_params)
      redirect_to @vessel
    else
      render :edit
    end
  end

  def destroy
    @vessel.destroy
  end

  private
    def set_vessel
      @vessel = Vessel.find(params[:id])
    end

    def set_project_options
      @project_options = current_user.projects.map{ |u| [ u.reference, u.id ]}.uniq { |x| x[0] }
    end

    def vessel_params
      params.require(:vessel).permit(:project_id, :hull_number)
    end
end
