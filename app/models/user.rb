class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :name, :password, :password_confirmation

  # validations
  validates :name, presence: :true
  validates :name, uniqueness: true
end
