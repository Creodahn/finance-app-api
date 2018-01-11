class Api::AccountResource < Api::BaseResource
  attributes :balance, :description, :name

  has_one :account_type
  has_one :group
  has_one :profile

  has_many :transactions

  def self.updatable_fields(context)
    super - [:balance]
  end

  def self.creatable_fields(context)
    super - [:balance]
  end

  filter :account_type
  filter :profile
end
