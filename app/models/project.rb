class Project < ActiveRecord::Base
  attr_accessible :name, :userstories_attributes

  has_many :userstories

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
    userstories.unaccepted
  end

  def accepted_userstories
    userstories.accepted
  end

  def backlog
  end
end
