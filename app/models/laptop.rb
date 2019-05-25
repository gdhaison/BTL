class Laptop < ApplicationRecord
    belongs_to :brand
    has_many :orders
    validates :name, presence: true
    validates :descripetion, presence: true
    validates :price, presence: true
    has_attached_file :image1
    has_attached_file :image2
    has_attached_file :image3
    validates_attachment :image1,
    content_type: { content_type: /\Aimage\/.*\z/ },
    size: { less_than: 1.megabyte }
    validates_attachment :image2,
    content_type: { content_type: /\Aimage\/.*\z/ },
    size: { less_than: 1.megabyte }
    validates_attachment :image3,
    content_type: { content_type: /\Aimage\/.*\z/ },
    size: { less_than: 1.megabyte }

    scope :search, ->(term){where "name LIKE ?", "%#{term}%"}
    scope :sorted, ->{order created_at: :desc}
end
