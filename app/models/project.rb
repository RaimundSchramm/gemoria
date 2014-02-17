class Project < ActiveRecord::Base

  # associations
  has_many :sprints
  has_many :userstories
  has_many :ownerships
  has_many :users, through: :ownerships

  accepts_nested_attributes_for :userstories, allow_destroy: true

  #attributes and constants
  #  derived attributes and counters
  def size_of_all_userstories
    userstories.size
  end

  def size_of_accepted_userstories
    userstories.accepted.size
  end

  def size_of_all_tasks
    userstories.joins(:tasks).size
  end

  def size_of_completed_tasks
    userstories.accepted.joins(:tasks).where("tasks.complete = ?", true).size
  end

  def unaccepted_userstories
    userstories.unaccepted.load
  end

  def accepted_userstories
    userstories.accepted.load
  end

  def backlog
    userstories.backlog.load
  end

  def sprint
    userstories.sprint.load
  end

  def current_sprint_complete?
    accepted_userstories.to_a == sprint.to_a ? true : false
  end

  def done
    userstories.done.load
  end

  # callbacks
  after_create :create_initial_sprint

  private

  def create_initial_sprint
    sprints.create
  end
end
