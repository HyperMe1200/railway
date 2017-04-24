class Carriage < ApplicationRecord
  belongs_to :train

  validates :number, uniqueness: {scope: :train_id}

  before_validation :set_number

  TYPES = {
    EconomyCarriage: 'Плацкартный',
    CoupeCarriage: 'Купейный',
    SitCarriage: 'Сидячий',
    SleepCarriage: 'Спальный'}

  private

  def set_number
    self.number ||= train.carriages.maximum(:number).to_i + 1
  end
end