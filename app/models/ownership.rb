class Ownership < ActiveRecord::Base

  # attributes and constants
  attr_accessible :project_id, :user_id

  # associations
  belongs_to :project
  belongs_to :user
end
