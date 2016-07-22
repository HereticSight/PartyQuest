class Campaign < ActiveRecord::Base
  belongs_to :leader, class_name: "User", foreign_key: :leader_id
  has_and_belongs_to_many :users
  has_and_belongs_to_many :quests
  belongs_to :location
end
