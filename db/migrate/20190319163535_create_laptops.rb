class CreateLaptops < ActiveRecord::Migration[5.2]
  def change
    create_table :laptops do |t|
      t.string :name
      t.string :price
      t.attachment :image1
      t.attachment :image2
      t.attachment :image3
      t.string :descripetion
      t.string :ram
      t.string :monitor
      t.string :weight

      t.timestamps
    end
  end
end
