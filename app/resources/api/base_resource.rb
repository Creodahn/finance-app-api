class Api::BaseResource < JSONAPI::Resource
  abstract

  attribute :created_at
  attribute :updated_at
  attribute :system_message

  before_update :set_editing_user
  after_update :set_editing_user
  after_create :set_editing_user

  after_remove :valid_removal?

  before_remove :set_deleting_user

  def created_at
    @model.created_at
  end

  def system_message
    @model.try(:system_message)
  end

  def set_deleting_user
    if @model.respond_to?(:current_editing_user)
      unless context[:current_user].blank?
        @model.current_editing_user = context[:current_user]
      end
    end
  end

  def set_editing_user
    if @model.respond_to?(:current_editing_user)
      unless context[:current_user].blank?
        @model.current_editing_user = context[:current_user]
      end
    end
  end

  def valid_removal?
    unless @model.destroyed?
      raise JSONAPI::Exceptions::RecordLocked.new("#{@model.errors.full_messages.join('. ')}")
    end
  end

  def skip_callbacks
    if @model.is_a? StepCompany
      StepCompany.skip_callback(:destroy, :before, :send_removed_notification)
    end
  end

  def set_callbacks
    if @model.is_a? StepCompany
      StepCompany.set_callback(:destroy, :before, :send_removed_notification)
    end
  end
end
