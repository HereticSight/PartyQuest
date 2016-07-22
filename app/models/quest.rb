class Quest < ActiveRecord::Base
  has_and_belongs_to_many :campaigns

  validates :name, presence: true, length: { in: 6..128 }
  validates :price_range, presence: true, length: 1
end
