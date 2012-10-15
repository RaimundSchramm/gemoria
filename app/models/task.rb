class Task < ActiveRecord::Base
  attr_accessible :userstory_id, :complete, :name
  belongs_to :userstory
end
