class Api::ContactInfoTypeResource < Api::BaseResource
  attributes :name, :description, :phone_only

  has_many :addresses
  has_many :phone_numbers

  filter :name
  filter :phone_only
end
