class User < ActiveRecord::Base
  include PgSearch
  multisearchable :against =>[:username, :bio, :city, :state, :first_name, :last_name]
  has_many :created_campaigns, foreign_key: :leader_id, class_name: "Campaign", dependent: :destroy
  has_and_belongs_to_many :campaigns
  has_many :quests, through: :campaigns
  has_many :visited_locations, through: :campaigns, source: :location
  has_many :quests, through: :campaigns, source: :quests

  has_attached_file :avatar, styles:
    { thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'},
    size: { in: 0..5000.kilobytes },
    :default_url => ActionController::Base.helpers.asset_path('default.png')
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  email_regex = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,63}\z/i
  password_format = /\A.*(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&+=]).*\z/
  validates :username, uniqueness: true, presence: true, length: { in: 6..64 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: email_regex }
  validates :password, format: { with: password_format,
                       message: "must contain at least 1 capital letter, 1 lowercase letter, 1 number, and 1 special character" },
                       length: { in: 6..32 },
                       allow_nil: true
  has_secure_password
  validates :bio, length: { maximum: 1000 }
  validates :city, length: { maximum: 64 }
  validates :state, length: { maximum: 64 }
  validates :first_name, length: { maximum: 32 }
  validates :last_name, length: { maximum: 32 }
end
