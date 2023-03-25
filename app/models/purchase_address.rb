class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :post_code, :city_id, :address, :address_number, :building, :phone_number, :item_id, :user_id

  with_options presence: true do
    validates :post_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :address, presence: true
    validates :address_number, presence: true
    validates :building
    validates :phone_number, presence: true, numericality: {with: /\A[0-9]+\z/}
    validates :item_id, presence: true
    validates :user_id, presence: true
  end

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id, address_id: address.id)
    address = Address.create(post_code: post_code, city_id: city_id, address: address, address_number: address_number,phone_number: phone_number, building: building, purchase_id: purchase.id) 
  end

end