class Api::TransactionResource < Api::BaseResource
  attributes :amount, :is_debit, :transaction_date

  has_one :account
  has_one :profile
  has_one :transaction_type

  def self.updatable_fields(context)
    super - [:is_debit]
  end

  def self.creatable_fields(context)
    super - [:is_debit]
  end
end
