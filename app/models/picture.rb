class Picture < ActiveRecord::Base
  belongs_to :campaign
  has_attached_file :image, styles:
    { thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'},
    size: { in: 0..5000.kilobytes }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

end
