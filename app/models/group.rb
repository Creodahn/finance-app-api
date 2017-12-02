class Group < ApplicationRecord
  validates :name, presence: true

  has_many :accounts
  has_many :images, as: :imageable
  has_many :memberships
  has_many :profiles, through: :memberships

  def membership_count
    self.memberships.count
  end
end
