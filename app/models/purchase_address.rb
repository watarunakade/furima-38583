class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :post_code, :area_id, :address_street, :address_number, :building, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :address_street
    validates :address_number
    validates :building, allow_blank: true
    validates :phone_number, format: {with: /\A\d{10,11}\z/}
    validates :item_id
    validates :user_id
    validates :token
  end

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id )
    address = Address.create(post_code: post_code, area_id: area_id, address_street: address_street, address_number: address_number,phone_number: phone_number, building: building, purchase_id: purchase.id) 
  end

end