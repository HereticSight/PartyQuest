class Location < ActiveRecord::Base
  has_many :campaigns

  include PgSearch
  multisearchable :against => [:latitude, :longitude, :address, :city, :state]

end
