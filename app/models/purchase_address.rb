class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :house_number, :building, :phone_number, :exhibit_id, :user_id, :token

  with_options presence: true do
    validates :user_id
    validates :exhibit_id
    validates :house_number
    validates :post_code,    format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :city, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ }
    validates :phone_number, length: { minimum: 10, maximum: 11 }, format: { with: /\A[0-9]+\z/ }
    validates :token
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    ActiveRecord::Base.transaction do
      purchase = Purchase.create(exhibit_id: exhibit_id, user_id: user_id)
      Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, house_number: house_number,
                     building: building, phone_number: phone_number, purchase_id: purchase.id)
    end
  end
end
