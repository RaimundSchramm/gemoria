class Role < ActiveRecord::Base

  has_many :ownerships
end
