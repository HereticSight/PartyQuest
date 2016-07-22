class User < ActiveRecord::Base
  has_attached_file :avatar

  email_regex = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,63}\z/i
  password_format = /\A.*(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&+=]).*\z/
  validates :username, null: false, uniqueness: true, presence: true, length: { in: 6..64 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: email_regex }
  validates :password, format: { with: password_format, message: "password must contain at least 1 capital letter, 1 lowercase letter, 1 number, and 1 special character" }, length: { in: 6..32 }
  has_secure_password
  validates :bio, length: { maximum: 1000 }
  validates :city, length: { maximum: 64 }
  validates :state, length: { maximum: 64 }
end
