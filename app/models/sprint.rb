class Sprint < ActiveRecord::Base

  # associations
  belongs_to      :project
  has_many        :userstories

  def complete!
    userstories.sprint.each { |userstory| userstory.done! }
    self.complete = true
    save
  end
end
