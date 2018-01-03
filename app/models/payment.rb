class Payment < ApplicationRecord
  validates :amount, presence: true

  belongs_to :profile
  belongs_to :account_transaction, foreign_key: 'transaction_id', class_name: 'Transaction'
end
