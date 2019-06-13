class OrderItem < ApplicationRecord
  belongs_to :laptop
  belongs_to :order

end
