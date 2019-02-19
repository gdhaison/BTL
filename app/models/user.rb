class User < ApplicationRecord
  VALIDATE_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  before_save { email.downcase! }  
  validates :name, presence: true
  validates :email, presence: true, length: {maximum: 225},
      format: {with: VALIDATE_EMAIL_REGEX}, uniqueness: { case_sensitive: false }
  has_secure_password
end
