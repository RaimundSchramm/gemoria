class Userstory < ActiveRecord::Base
  # attributes and constants
  attr_accessible :project_id, :description, :name, :complete, :tasks_attributes, :status

  # associations
  belongs_to  :project
  has_many    :tasks
  has_many    :acceptance_tests

  accepts_nested_attributes_for :tasks, allow_destroy: true

  # scopes
  scope :complete,    where(complete: true)
  scope :incomplete,  where(complete: false)
  scope :opened,      where(status: 'opened')
  scope :recent,      where(status: 'recent').order('updated_at desc')

  # derived attributes
  def full_name
    "#{name}: #{description}"
  end

  # delegates
  def incomplete_tasks
    tasks.incomplete
  end

  def complete_tasks
    tasks.complete
  end
end
