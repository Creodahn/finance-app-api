class Api::AccountTypeResource < Api::BaseResource
  attributes :name, :description, :is_debt, :require_routing_number

  has_many :accounts

  filter :name
end
