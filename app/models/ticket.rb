class Ticket < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :train, optional:true
  belongs_to :first_station, class_name: 'RailwayStation', foreign_key: :first_station_id, optional: true
  belongs_to :last_station, class_name: 'RailwayStation', foreign_key: :last_station_id, optional: true
end
