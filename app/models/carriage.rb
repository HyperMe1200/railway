class Carriage < ApplicationRecord
  belongs_to :train

  TYPES = %i(купейный плацкартный)
end