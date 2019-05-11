class Micropost < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 5000 }
  default_scope -> { order(created_at: :desc) }
  has_attached_file :image2
  validates_attachment :image2,
    content_type: { content_type: /\Aimage\/.*\z/ },
    size: { less_than: 1.megabyte }

end 
