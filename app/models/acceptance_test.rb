class AcceptanceTest < ActiveRecord::Base
  # attributes and constants
  attr_accessible :description, :complete

  # associations
  belongs_to :userstory

  # scopes
  scope :complete,    where(complete: true)
  scope :incomplete,  where(complete: false)

end