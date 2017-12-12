class Api::RightResource < Api::BaseResource
  attributes :name, :scope

  has_many :roles
end
