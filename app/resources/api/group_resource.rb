class Api::GroupResource < Api::BaseResource
  attributes :name, :description

  has_many :memberships
  has_many :profiles

  filter :description
  filter :membership
  filter :name
  filter :profile
end
