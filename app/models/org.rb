class Org < ApplicationRecord
  belongs_to :user
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships, source: :user

  validates :name, presence: true, length: { in: 5..20 }
  validates :desc, presence: true, length: { in: 10..250 }
end
