class Group < ApplicationRecord
  validates :name, presence: true

  has_many :images, as: :imageable
  has_many :memberships
  has_many :profiles, through: :memberships
end
