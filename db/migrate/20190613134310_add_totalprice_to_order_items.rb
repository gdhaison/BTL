class AddTotalpriceToOrderItems < ActiveRecord::Migration[5.2]
  def change
    add_column :order_items, :total_price, :decimal, precision: 12, scale: 3
  end
end
