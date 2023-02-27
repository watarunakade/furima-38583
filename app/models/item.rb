class Item < ApplicationRecord
  belongs_to :model
  has_one_attached :image
end
