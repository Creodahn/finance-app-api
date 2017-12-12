class Transaction < ApplicationRecord
  validates :amount, presence: true

  after_save :update_account_balance

  belongs_to :account
  belongs_to :profile
  belongs_to :transaction_type

  private

  def update_account_balance
    account = self.account

    account.balance += self.amount * (self.transaction_type.is_debit ? -1 : 1)

    account.save!
  end
end
