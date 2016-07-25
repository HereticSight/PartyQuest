class Campaign < ActiveRecord::Base
  include PgSearch
  multisearchable :against => [:name], if: :active_campaign?
  has_many :pictures
  belongs_to :leader, class_name: "User", foreign_key: :leader_id
  has_and_belongs_to_many :users
  has_and_belongs_to_many :quests
  belongs_to :location

  before_create :create_invitation_digest

  validates :name, presence: true, length: { in: 6..128 }
  validates :leader_id, presence: true

  validate :start_date_in_future
  validate :end_date_after_start_date

  def start_date_in_future
    if start_time.present? && start_time < DateTime.now
      errors.add(:start_time, "Don't live in the past! Campaigns can only be started in the future!")
    end
  end

  def end_date_after_start_date
    if end_time.present? && end_time < start_time
      errors.add(:end_time, "Campaigns must end after your start date!")
    end
  end

  def active_campaign?
    end_time > Time.now
  end

  private
    def create_invitation_digest
      self.invite_link = SecureRandom.urlsafe_base64
    end
end
