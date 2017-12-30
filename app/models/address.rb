class Address < ApplicationRecord
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true

  before_save :check_primary_flag

  belongs_to :contact_info_type
  belongs_to :profile

  def check_primary_flag
    if self.is_primary
      self.profile.addresses.each do |a|
        a.is_primary = false
        a.save
      end

      self.is_primary = true
    end
  end
end
