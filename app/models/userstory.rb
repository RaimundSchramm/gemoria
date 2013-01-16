class Userstory < ActiveRecord::Base
  # attributes and constants
  attr_accessible :project_id, :description, :name, :complete, :tasks_attributes, :status

  STATUS = { opened: 'opened', started: 'started', completed: 'completed', rejected: 'rejected', accepted: 'accepted' }

  # associations
  belongs_to  :project
  has_many    :tasks
  has_many    :acceptance_tests

  accepts_nested_attributes_for :tasks, allow_destroy: true

  # scopes
  scope :accepted,    where(status: STATUS[:accepted])
  scope :unaccepted,  where('status <> ?', STATUS[:accepted])
  scope :opened,      where(status: 'opened')
  scope :recent,      where(status: 'recent').order('updated_at desc')


  # callbacks
  after_create :initialize_status_as_opened
  def initialize_status_as_opened
    self.status = STATUS[:opened]
    self.save
  end

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
