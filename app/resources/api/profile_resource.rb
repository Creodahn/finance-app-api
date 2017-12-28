class Api::ProfileResource < Api::BaseResource
  attributes :bio, :name, :email

  has_one :user

  has_many :accounts
  has_many :addresses
  has_many :images
  has_many :memberships
  has_many :phone_numbers

  # through relationships
  has_many :groups

  filter :email
  filter :name
end
