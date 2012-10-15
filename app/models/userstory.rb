class Userstory < ActiveRecord::Base
  attr_accessible :project_id, :description, :name, :complete, :tasks_attributes

  belongs_to :project
  has_many :tasks

  accepts_nested_attributes_for :tasks, allow_destroy: true

  scope :complete,    where(complete: true)
  scope :incomplete,  where(complete: false)
end
