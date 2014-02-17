class Category < ActiveRecord::Base

  # attributes and constants

  # associations
  has_many :userstories
end
