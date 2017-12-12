class Api::RoleResource < Api::BaseResource
  attributes :name

  has_many :groups
  has_many :profiles
  has_many :rights
end
