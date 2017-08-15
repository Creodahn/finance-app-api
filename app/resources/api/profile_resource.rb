class Api::ProfileResource < Api::BaseResource
  attributes :name, :email

  has_one :user

  has_many :addresses
  has_many :groups
  has_many :images
  has_many :memberships
  has_many :phone_numbers

  filter :email
  filter :name
end
