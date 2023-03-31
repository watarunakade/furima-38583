class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :post_code, :area_id, :address_street, :address_number, :building, :phone_number, :item_id, :user_id, :address_id, :purchase_id

  with_options presence: true do
    validates :post_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :address_street, presence: true
    validates :address_number, presence: true
    validates :building, allow_blank: true
    validates :phone_number, presence: true, format: {with: /\A\d{9,10}\z/}
    validates :item_id, presence: true
    validates :user_id, presence: true
  end

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id )
    address = Address.create(post_code: post_code, area_id: area_id, address_street: address_street, address_number: address_number,phone_number: phone_number, building: building, purchase_id: purchase.id) 
  end

end