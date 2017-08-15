class Api::AddressResource < Api::BaseResource
  attributes :address, :apartment_number, :city, :state, :zip_code, :is_primary

  has_one :contact_info_type
  has_one :profile

  filter :contact_info_type
  filter :profile
end
