class Group < ApplicationRecord
  validates :name, presence: true

  has_many :accounts
  has_many :images, as: :imageable
  has_many :memberships
  has_many :profiles, through: :memberships

  def balance
    balance = 0
    self.accounts.each do |acct|
      balance += acct.balance
    end

    return balance
  end
end
