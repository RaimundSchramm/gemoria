class Project < ActiveRecord::Base
  attr_accessible :name, :userstories_attributes

  has_many :userstories

  accepts_nested_attributes_for :userstories, allow_destroy: true
end
