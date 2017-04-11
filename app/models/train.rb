class Train < ApplicationRecord
  belongs_to :route
  has_many :tickets
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  has_many :carriages

  def carriages_count(kind)
    carriages.where(kind: kind).size
  end

  def seats_count(kind, seats_kind)
    sum = 0
    carriages.where(kind: kind).each do |carriage|
      if seats_kind == :top
        sum += carriage.top_seats
      elsif seats_kind == :bottom
        sum += carriage.bottom_seats
      end
    end
    sum
  end
end
