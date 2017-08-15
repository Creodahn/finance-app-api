class Membership < ApplicationRecord
  validates :group, presence: true
  validates :profile, presence: true

  has_one :group
  has_one :profile
end
