class Quest < ActiveRecord::Base
  belongs_to :location
  belongs_to :activity
  belongs_to :party
end
