class Ticket < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :train
  belongs_to :first_station, class_name: 'RailwayStation', foreign_key: :first_station_id
  belongs_to :last_station, class_name: 'RailwayStation', foreign_key: :last_station_id

  validates :user_passport, :user_name, presence: true

  after_validation :set_user

  private

  def set_user
    user = User.where(name: user_name).first
    self.user =
      if user
        user
      else
        User.create(name: user_name)
      end
  end
end
