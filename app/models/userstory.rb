class Userstory < ActiveRecord::Base
  # attributes and constants
  attr_accessible :project_id, :description, :name, :complete, :tasks_attributes, :status

  # associations
  belongs_to :project
  has_many :tasks

  accepts_nested_attributes_for :tasks, allow_destroy: true

  # scopes
  scope :complete,    where(complete: true)
  scope :incomplete,  where(complete: false)
  scope :opened,      where(status: 'opened')

  # derived attributes
  def full_name
    "#{name}: #{description}"
  end
end
