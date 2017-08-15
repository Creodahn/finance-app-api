class Address < ApplicationRecord
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true

  belongs_to :contact_info_type
  belongs_to :profile
end
