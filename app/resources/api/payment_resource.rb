class Api::PaymentResource < Api::BaseResource
  attributes :amount, :completed, :completed_on

  has_one :profile
  has_one :transaction

  filter :profile
  filter :transaction
end
