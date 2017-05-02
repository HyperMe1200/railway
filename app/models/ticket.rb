class Ticket < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :train
  belongs_to :first_station, class_name: 'RailwayStation', foreign_key: :first_station_id
  belongs_to :last_station, class_name: 'RailwayStation', foreign_key: :last_station_id

  validates :user_passport, :user_name, presence: true

  after_create :send_buy_email
  after_destroy :send_delete_email

  private

  def send_buy_email
    TicketsMailer.deliver_buy_ticket(self.user, self)
  end

  def send_delete_email
    TicketsMailer.deliver_delete_ticket(self.user, self)
  end
end
