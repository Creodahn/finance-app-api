class PhoneNumber < ApplicationRecord
  validates :country_code, presence: true
  validates :area_code, presence: true, length: { is: 3 }
  validates :prefix, presence: true, length: { is: 3 }
  validates :subscriber_number, presence: true, length: { is: 4 }
  validates :contact_info_type, presence: true
  validates :profile, presence: true

  belongs_to :contact_info_type
  belongs_to :profile
end
