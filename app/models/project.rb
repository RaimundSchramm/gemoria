class Project < ActiveRecord::Base
  attr_accessible :name, :userstories_attributes

  has_many :userstories

  accepts_nested_attributes_for :userstories, allow_destroy: true

  #attributes and constants
  #  derived attributes and counters
  def size_of_all_userstories
    userstories.size
  end

  def size_of_completed_userstories
    userstories.complete.size
  end

  def size_of_all_tasks
    userstories.joins(:tasks).size
  end

  def size_of_completed_tasks
    userstories.joins(:tasks).complete.size
  end
end
