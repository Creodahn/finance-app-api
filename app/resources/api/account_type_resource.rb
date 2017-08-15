class Api::AccountTypeResource < Api::BaseResource
  attributes :name, :description, :is_debt

  has_many :accounts

  filter :name
end
