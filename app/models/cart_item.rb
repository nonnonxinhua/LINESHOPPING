class CartItem < ApplicationRecord

  belongs_to :admin
  belongs_to :item
end
