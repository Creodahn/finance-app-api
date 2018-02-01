class Api::MembershipResource < JSONAPI::Resource
  attributes :created_at, :updated_at

  has_one :group
  has_one :profile
end
