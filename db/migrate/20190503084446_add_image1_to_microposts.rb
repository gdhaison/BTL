class AddImage1ToMicroposts < ActiveRecord::Migration[5.2]
  def change
    add_column :microposts, :image1, :attachment
  end
end
