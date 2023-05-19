class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :exhibit
  has_one :address
end
