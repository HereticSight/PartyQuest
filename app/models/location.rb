class Location < ActiveRecord::Base
  has_many :campaigns
  include PgSearch
  pg_search_scope :search_full_text, :against => {
    :latitude => 'A',
    :longitude => 'A',
    :address => 'B',
    :city => 'C',
    :state => 'D'
  }

end
