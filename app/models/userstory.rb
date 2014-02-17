class Userstory < ActiveRecord::Base

  # attributes and constants
  STATUS   = {        opened:    'opened',
                      started:   'started',
                      completed: 'completed',
                      rejected:  'rejected',
                      accepted:  'accepted' }
  POSITION = {        backlog:   'backlog',
                      sprint:    'sprint',
                      done:      'done' }

  # associations
  belongs_to          :project
  belongs_to          :category
  belongs_to          :sprint
  has_many            :tasks
  has_many            :acceptance_tests

  # scopes
  scope :sprint,      -> { where(position: POSITION[:sprint]) }
  scope :accepted,    -> { sprint.where(status: STATUS[:accepted]) }
  scope :unaccepted,  -> { where('status <> ?', STATUS[:accepted]) }
  scope :opened,      -> { where(status: 'opened') }
  scope :recent,      -> { where(status: 'recent').order('updated_at desc') }
  scope :backlog,     -> { where(position: POSITION[:backlog]) }
  scope :done,        -> { where(position: POSITION[:done]) }

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

  def category_name
    category ? category.name : ""
  end

  # state changing methods
  def done!
    self.position = Userstory::POSITION[:done]
    save
  end

  # callbacks
  before_create :initialize_status_as_opened
  before_create :initialize_position_as_backlog

  protected

  def initialize_status_as_opened
    self.status = STATUS[:opened]
  end

  def initialize_position_as_backlog
    self.position = POSITION[:backlog]
  end
end
