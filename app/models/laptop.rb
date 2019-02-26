class Laptop < ApplicationRecord
    validates :name, presence: true
    validates :descripton, presence: true
    validates :price, presence: true
end
