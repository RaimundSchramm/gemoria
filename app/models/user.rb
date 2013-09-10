class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :name, :password, :password_confirmation

  # associations
  has_many :ownerships
  has_many :projects, through: :ownerships

  # validations
  validates :name, presence: :true
  validates :name, uniqueness: true

  def has_ownership?(project)
    ownerships.map(&:project_id).include?(project.id) ? true : false
  end
end
