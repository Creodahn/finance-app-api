class Api::TransactionResource < Api::BaseResource
  attributes :amount

  has_one :account
  has_one :profile
  has_one :transaction_type
end
