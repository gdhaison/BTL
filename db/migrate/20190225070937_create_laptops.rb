class CreateLaptops < ActiveRecord::Migration[5.2]
  def change
    create_table :laptops do |t|
      t.string :type
      t.string :name
      t.string :descripton
      t.string :price
      t.string :image

      t.timestamps
    end
  end
end
