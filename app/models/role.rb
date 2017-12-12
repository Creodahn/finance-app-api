class Role < ApplicationRecord
  validates :name, presence: true

  has_many :memberships
  has_and_belongs_to_many :rights

  # through relationships
  has_many :groups, through: :memberships
  has_many :profiles, through: :memberships
end
