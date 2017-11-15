class Api::UserResource < Api::BaseResource
  attributes :authenticated_at, :auth_token, :username, :password

  has_one :profile

  def self.updatable_fields(context)
    super - [:username]
  end

  def self.creatable_fields(context)
    super - [:username]
  end

  def fetchable_fields
    super - [:password]
  end

  filter :username, apply: -> (records, value, options) {
    records.where(id: records.map{ |r| r.id if r.username == value.first })
  }
end
