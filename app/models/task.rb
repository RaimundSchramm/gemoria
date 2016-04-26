class Task < ActiveRecord::Base

  # attributes and constants

  # associations
  belongs_to :userstory

  # scopes
  default_scope { order(:number) }
  scope :complete,    -> { where(complete: true) }
  scope :incomplete,  -> { where(complete: false) }
end
