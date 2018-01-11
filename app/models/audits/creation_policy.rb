module Audits
  class CreationPolicy
    include Utility

    def initialize(auditable)
      @auditable = auditable
      @success = true
      @msg = ""
    end

    def audit_changes
      begin
        ActiveRecord::Base.transaction do
          loop_changed_fields
        end
        @msg = "Successfully Audited #{@auditable.class.to_s}"
      rescue Exception => e
        @success = false
        @msg =  "Audit failed to save due to error: #{e.inspect}"
      end
      return {success: @success, message: @msg}
    end
  end
end
