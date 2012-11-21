class Task < ActiveRecord::Base
  # attributes and constants
  attr_accessible :userstory_id, :complete, :name

  # associations
  belongs_to :userstory

  # scopes
  scope :complete,    where(complete: true)
  scope :incomplete,  where(complete: false)
end
