class Api::MembershipResource < JSONAPI::Resource
  has_one :group
  has_one :profile
end
