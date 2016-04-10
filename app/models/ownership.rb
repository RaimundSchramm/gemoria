class Ownership < ActiveRecord::Base

  # attributes and constants

  # associations
  belongs_to :project
  belongs_to :user
  belongs_to :role
end
