class Party < ActiveRecord::Base
  belongs_to :leader, class_name: "User", foreign_key: :leader_id
  has_and_belongs_to_many :users
  has_many :quests
  has_many :activites, through: :quests
  has_one :location, through: :quests
end
