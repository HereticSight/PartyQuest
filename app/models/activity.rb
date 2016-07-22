class Activity < ActiveRecord::Base
  has_and_belongs_to_many :quests
end
