class Api::AuditResource < Api::BaseResource
  attributes :action, :column_name, :current_value, :initial_value

  has_one :auditable, polymorphic: true
  has_one :profile

  filter :action
  filter :column_name
  filter :profile
end
