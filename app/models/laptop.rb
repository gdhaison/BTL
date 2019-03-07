class Laptop < ApplicationRecord
    validates :name, presence: true
    validates :descripton, presence: true
    validates :price, presence: true
    mount_uploader :image, ImageUploader
    scope :Dell, ->{where company: "Dell"}
    scope :Asus, ->{where company: "Asus"}
    scope :MSI, ->{where company: "MSI"}
end
