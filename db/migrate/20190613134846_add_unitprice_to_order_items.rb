class AddUnitpriceToOrderItems < ActiveRecord::Migration[5.2]
  def change
    add_column :order_items, :unit_price, :decimal, precision: 12, scale: 3
  end
end
