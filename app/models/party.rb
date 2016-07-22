class Party < ActiveRecord::Base
  belongs_to :leader, class_name: "User", foreign_key: :leader_id
  has_and_belongs_to_many :users
  has_many :quests
  has_many :activities, through: :quests, source: :activities
  has_many :locations, through: :quests, source: :location
end
