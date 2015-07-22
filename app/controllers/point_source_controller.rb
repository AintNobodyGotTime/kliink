class PointSourceController < ApplicationController
  def create
    @point_source = PointSource.new
    if params != nil
      @point_source.user_id = params[:user_id].to_i
      @point_source.project_id = params[:project_id].to_i
      @point_source.source = params[:source].to_s
      @point_source.points = params[:points].to_i
      @point_source.save

      @user = User.find(@point_source.user_id)
      @user.total_points += @point_source.points
      @user.save
    end
    render :nothing => true, :status => 200 and return
  end
end
