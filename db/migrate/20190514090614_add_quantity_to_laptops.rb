class AddQuantityToLaptops < ActiveRecord::Migration[5.2]
  def change
    add_column :laptops, :quantity, :integer
  end
end
