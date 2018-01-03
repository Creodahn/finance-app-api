class Transaction < ApplicationRecord
  validates :amount, presence: true
  validates :transaction_date, presence: true

  after_save :update_account_balance

  belongs_to :account
  belongs_to :profile
  belongs_to :transaction_type

  has_many :payments

  def is_debit
    self.transaction_type.is_debit
  end

  private

  def update_account_balance
    account = self.account

    account.balance += self.amount * (self.transaction_type.is_debit ? -1 : 1)

    account.save!
  end
end
