class Sprint < ActiveRecord::Base
  attr_accessible :project_id,
                  :complete

  belongs_to      :project
  has_many        :userstories

  def complete!
    userstories.sprint.each { |userstory| userstory.done! }
    self.complete = true
    save
  end
end
