class User < ActiveRecord::Base
  has_secure_password

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
