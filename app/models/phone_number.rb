class PhoneNumber < ApplicationRecord
  validates :country_code, presence: true
  validates :area_code, presence: true, length: { is: 3 }
  validates :prefix, presence: true, length: { is: 3 }
  validates :subscriber_number, presence: true, length: { is: 4 }
  validates :contact_info_type, presence: true
  validates :profile, presence: true

  before_save :check_primary_flag

  belongs_to :contact_info_type
  belongs_to :profile

  def check_primary_flag
    if self.is_primary
      self.profile.phone_numbers.each do |pn|
        pn.is_primary = false
        pn.save
      end

      self.is_primary = true
    end
  end
end
