class RailwayStationsRoute < ApplicationRecord
  belongs_to :railway_station
  belongs_to :route

  scope :ordered, -> { order(:station_number) }

  validates :railway_station_id, uniqueness: { scope: :route_id }
end