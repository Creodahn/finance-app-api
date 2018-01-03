module Audits
  module Utility
    protected
    def loop_changed_fields
      for field in @auditable.changed
        unless ['created_at','updated_at'].include? field
          set_audit(field)
        end
      end
    end

    def track_deletion
      audit = Audit.new(auditable: @auditable, record_deletion: true)
      unless @auditable.current_editing_user.blank?
        audit.editor = @auditable.current_editing_user
      end
      audit.save!
    end

    private
    def set_audit(field)
      audit = Audit.new(field_edited: field)
      unless @auditable.current_editing_user.blank?
        audit.editor = @auditable.current_editing_user
      end
      case @auditable.column_for_attribute(field).type
        when :datetime, :date, :time
          set_time_field_to_string(audit, field)
        else
          set_field_to_string(audit, field)
      end
      attach_to_auditable(audit)
    end

    def set_field_to_string(audit, field)
      audit.old_field_value = @auditable.send("#{field}_was".to_sym).to_s
      audit.new_field_value = @auditable.send("#{field}".to_sym).to_s
    end

    def set_time_field_to_string(audit, field)
      audit.old_field_value = @auditable.send("#{field}_was".to_sym).try(:strftime, "%m/%d/%Y %l:%M %P")
      audit.new_field_value = @auditable.send("#{field}".to_sym).try(:strftime, "%m/%d/%Y %l:%M %P")
    end

    def attach_to_auditable(audit)
      @auditable.audits << audit
    end
  end
end
