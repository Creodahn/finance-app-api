class Audit < ApplicationRecord
  validates :action, presence: true,
                     inclusion: { in: %w(INSERT UPDATE DELETE),
                     message: "%{value} is not a valid action" }
  validates :auditable_type, presence: true
  validates :auditable_id, presence: true
  validates :profile, presence: true

  belongs_to :profile
end
