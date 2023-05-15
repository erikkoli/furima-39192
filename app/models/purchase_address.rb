class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :house_number, :building, :phone_number, :user_id, :exhibit_id

  with_options presence: true do
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :city, :user_id, :exhibit_id 
    validates :house_number, format: { with: /\A[0-9\-]+\z/}
    validates :phone_number, length: { is: 11 }, format: { with: /\A[0-9]+\z/}
  end
  validates :prefecture_id, numericality: {other_than: 0}

  def save
    purchase = Purchase.create(exhibit_id: exhibit_id, user_id: user_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end