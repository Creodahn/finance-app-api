class TransactionType < ApplicationRecord
  validates :name, presence: true

  has_many :transactions
end
