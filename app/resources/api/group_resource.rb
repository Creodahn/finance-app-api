class Api::GroupResource < Api::BaseResource
  attributes :name, :description, :membership_count

  has_many :accounts
  has_many :memberships
  has_many :profiles

  filter :description
  filter :membership
  filter :name
  filter :profile

  def updatable_fields
    super - [:membership_count]
  end
end
