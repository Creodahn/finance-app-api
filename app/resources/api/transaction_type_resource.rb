class Api::TransactionTypeResource < Api::BaseResource
  attributes :is_debit, :name

  has_many :transactions

  filter :is_debit, :name
end
