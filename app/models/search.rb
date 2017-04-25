class Search
  def initialize(search_params)
    @first_station_id = search_params[:first_station_id]
    @last_station_id = search_params[:last_station_id]
  end

  def trains_search
    trains = Train.joins(route: :railway_stations)
    trains.where(railway_stations: { id: @first_station_id }) &
      trains.where(railway_stations: { id: @last_station_id })
  end
end