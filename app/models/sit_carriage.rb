class SitCarriage < Carriage
  validates :sitting_seats, presence: true
end