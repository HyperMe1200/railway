class SearchesController < ApplicationController
  before_action :railway_stations

  def show
  end

  def create
    @search = Search.new(search_params)
    @trains = @search.trains_search
    @first_station = RailwayStation.find(search_params[:first_station_id])
    @last_station = RailwayStation.find(search_params[:last_station_id])
    render 'show'
  end

  private

  def railway_stations
    @railway_stations = RailwayStation.all
  end

  def search_params
    params.permit(:first_station_id, :last_station_id)
  end
end