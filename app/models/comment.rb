class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :exhibit

  validates :text, presence: true
end
