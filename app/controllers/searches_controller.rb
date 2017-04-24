class SearchesController < ApplicationController
  def show
  end

  def create
    @search = Search.new(search_params)
    render 'show'
  end

  private

  def search_params
    params.require(:stations).permit(:first_station_id, :last_station_id)
  end
end