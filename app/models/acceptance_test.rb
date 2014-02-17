class AcceptanceTest < ActiveRecord::Base

  # attributes and constants

  # associations
  belongs_to :userstory

  # scopes
  scope :complete,    -> { where(complete: true) }
  scope :incomplete,  -> { where(complete: false) }
end
