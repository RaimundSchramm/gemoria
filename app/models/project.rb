class Project < ActiveRecord::Base
  attr_accessible :name, :userstories_attributes

  has_many :userstories
  has_many :sprints

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
    userstories.unaccepted.all
  end

  def accepted_userstories
    userstories.accepted.all
  end

  def backlog
    userstories.backlog.all
  end

  def sprint
    userstories.sprint.all
  end

  def current_sprint_complete?
    accepted_userstories == sprint ? true : false
  end

  def done
    userstories.done.all
  end

  # callbacks
  after_create :create_initial_sprint

  private

  def create_initial_sprint
    sprints.create
  end
end
