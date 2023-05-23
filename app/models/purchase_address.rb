class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :house_number, :building, :phone_number, :exhibit_id, :user_id, :token

  validates :user_id, presence: true
  validates :exhibit_id, presence: true
  validates :post_code, presence: true
  validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }, allow_blank: true
  validates :city, presence: true
  validates :house_number, presence: true
  validates :phone_number, presence: true
  validates :phone_number, length: { minimum: 10, maximum: 11 }, allow_blank: true
  validates :phone_number, format: { with: /\A[0-9]+\z/ }, allow_blank: true
  validates :token, presence: true
  validates :prefecture_id, numericality: { other_than: 1, message: "を選択してください" }

  def save
    ActiveRecord::Base.transaction do
      purchase = Purchase.create(exhibit_id: exhibit_id, user_id: user_id)
      Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, house_number: house_number,
                     building: building, phone_number: phone_number, purchase_id: purchase.id)
    end
  end
end
