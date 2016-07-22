class Quest < ActiveRecord::Base
  has_one :location
  has_and_belongs_to_many :activities
  belongs_to :party
  has_one :creator, through: :party, source: :leader
end
