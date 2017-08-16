class Membership < ApplicationRecord
  validates :group, presence: true
  validates :profile, presence: true

  belongs_to :group
  belongs_to :profile
end
