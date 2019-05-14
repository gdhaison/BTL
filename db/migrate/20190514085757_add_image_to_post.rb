class AddImageToPost < ActiveRecord::Migration[5.2]
  def up
    add_attachment :microposts, :image2
  end

  def down
    remove_attachment :microposts, :image2
  end
end
