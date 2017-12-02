class Api::AccountResource < Api::BaseResource
  attributes :account_number, :balance, :description, :name, :routing_number

  has_one :account_type
  has_one :group
  has_one :profile

  filter :account_type
  filter :profile
end
