class Train < ApplicationRecord
  belongs_to :route
  has_many :tickets
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  has_many :carriages

  def carriages_count(kind)
    carriages.where(type: kind).size
  end

  def seats_count(kind, seats_kind)
    carriages.where(type: kind).sum(seats_kind)
  end

  def ordered_carriages
    carriages.order(number: head_order ? :asc : :desc)
  end
end
