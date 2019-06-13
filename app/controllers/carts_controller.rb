class CartsController < ApplicationController
  def index
    @order_items=current_order.order_items
    @subtotal=0
    @order_items.each do |order_item|
    @subtotal=@subtotal+order_item.laptop.price.to_i*order_item.quantity
    end
    @total=@subtotal+100000
  end
end
