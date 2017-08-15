class AccountType < ApplicationRecord
  validates :name, presence: true

  has_many :accounts
end
