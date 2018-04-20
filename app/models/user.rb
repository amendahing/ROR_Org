class User < ApplicationRecord
  has_secure_password
  has_many :orgs, through: :memberships, source: :org
  has_many :memberships, dependent: :destroy

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
    validates :fname, :lname, presence: true, length: { in: 2..20 }
    validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }


end
