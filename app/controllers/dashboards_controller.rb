class DashboardsController < ApplicationController
  before_action :set_comments
  before_action :set_project_options
  before_action :set_vessel_options
  before_action :set_category_options

  def show
    #@process_group_by_dates = @comments.group(:status).group_by_day(:created_at).count
    @process_group_by_dates = @comments.group_by_day(:created_at).count
    sum = 0
    @process_group_by_dates = @process_group_by_dates.each { |k, v| @process_group_by_dates[k] = (sum = sum + v)}
  end

  private
  def set_comments
    @comments = Comment.where(project_id: current_user.projects.map{ |u| u.id})
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
end
