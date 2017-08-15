class Api::PhoneNumberResource < JSONAPI::Resource
  attributes :country_code, :area_code, :prefix, :subscriber_number, :extension, :is_primary

  has_one :contact_info_type
  has_one :profile

  filter :contact_info_type
  filter :profile
end
