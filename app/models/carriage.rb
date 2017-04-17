class Carriage < ApplicationRecord
  belongs_to :train

  validates :number, uniqueness: {scope: :train_id}

  before_validation :set_number

  TYPES = {
      EconomyCarriage: 'Плацкартный',
      CoupeCarriage: 'Купейный',
      SitCarriage: 'Сидячий',
      SleepCarriage: 'Спальный'
  }

  private

  def set_number
    if train.carriages.maximum(:number).nil?
      self.number = 1
    else
      self.number ||= train.carriages.maximum(:number) + 1
    end
  end
end