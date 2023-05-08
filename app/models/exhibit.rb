class Exhibit < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :region
  belongs_to :shipment

  validates :product, :explain, :price, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :postage_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :region_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :shipment_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }, format: { with: /\A[0-9]+\z/ }
end 