class Location < ActiveRecord::Base
  include PgSearch
  multisearchable :against => [:latitude, :longitude, :address, :city, :state]
  has_many :campaigns
end
