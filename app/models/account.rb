class Account < ApplicationRecord
  validates :name, presence: true
  validates :account_type, presence: true
  validates :profile, presence: true

  belongs_to :account_type
  belongs_to :group, optional: true
  belongs_to :profile

  has_many :transactions
end
