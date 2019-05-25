class Order < ApplicationRecord
    has_many :order_items
    def subtotal
        return 0
    end
end
