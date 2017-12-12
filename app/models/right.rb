class Right < ApplicationRecord
  validates :name, presence: true
  validates :scope, presence: true

  has_and_belongs_to_many :roles
end
