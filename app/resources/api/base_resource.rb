class Api::BaseResource < JSONAPI::Resource
  abstract

  attribute :created_at
  attribute :updated_at
end
