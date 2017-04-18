class EconomyCarriage < Carriage
  validates :top_seats, :side_top_seats, :side_bottom_seats, :bottom_seats, presence: true
end