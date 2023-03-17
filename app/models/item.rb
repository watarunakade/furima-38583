class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :area
  belongs_to :sendday
  has_one_attached :image
  belongs_to :user
  has_one    :purchase

  validates :image, presence: true
  validates :item_name, presence: true
  validates :item_text, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :postage_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :sendday_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
end
