class User < ApplicationRecord
  has_many :microposts, dependent: :destroy
  has_many :comment
  attr_accessor :remember_token
  VALIDATE_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  before_save { email.downcase! }  
  validates :name, presence: true
  validates :email, presence: true, length: {maximum: 225},
      
  format: {with: VALIDATE_EMAIL_REGEX}, uniqueness: { case_sensitive: false }
  has_secure_password
  class << self
  def digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  def new_token
    SecureRandom.urlsafe_base64
  end
end
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
  def forget
    update_attribute(:remember_digest, nil)
  end
end
