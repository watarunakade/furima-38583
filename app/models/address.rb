class Address < ApplicationRecord
  belongs_to :purchase
  belongs_to :item
  belongs_to :user
  belongs_to :area
end
