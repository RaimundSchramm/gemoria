class Userstory < ActiveRecord::Base
  attr_accessible :description, :name, :complete

  scope :complete,    where(complete: true)
  scope :incomplete,  where(complete: false)
end
