class Search

  attr_reader :result

  def initialize(search_params)
    @first_station_id = search_params[:first_station_id]
    @last_station_id = search_params[:last_station_id]
    @result = []
    @trains = trains_search
    result_calc
  end

  private

  def trains_search
    trains = Train.joins(route: :railway_stations)
    trains.where(railway_stations: { id: @first_station_id }) &
      trains.where(railway_stations: { id: @last_station_id }).to_a
  end

  def station_time(station_id, route, time_kind)
    RailwayStation.find(station_id).time_in(route, time_kind)
  end

  def result_calc
    return unless @trains
    @trains.each do |train|
      result = {}
      result[:id] = train.id
      result[:number] = train.number
      result[:route] = train.route.name
      result[:first_station_id] = @first_station_id
      result[:last_station_id] = @last_station_id
      result[:departure_time] = station_time(@first_station_id, train.route, :departure_time)
      result[:arrival_time] = station_time(@last_station_id, train.route, :arrival_time)
      @result << result
    end
  end
end