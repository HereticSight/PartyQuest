class Location < ActiveRecord::Base
  attr_accessor :raw_address
  include PgSearch
  multisearchable :against => [:latitude, :longitude, :address, :city, :state]

  has_many :campaigns

  geocoded_by :raw_address
  reverse_geocoded_by :latitude, :longitude

  after_validation -> {
    self.address = self.raw_address
    self.geocode
  }, if: ->(obj){ obj.raw_address.present? and obj.raw_address != obj.address }

  after_validation :reverse_geocode, unless: ->(obj){ obj.raw_address.present? },
                   if: ->(obj){ obj.latitude.present? and obj.latitude_changed? and obj.longitude.present? and obj.longitude_changed? }
end
