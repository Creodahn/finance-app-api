module Audits
  class DeletionPolicy
    include Utility

    def initialize(auditable)
      @auditable = auditable
      @success = true
      @msg = ""
    end

    def audit_deletion
      begin
        ActiveRecord::Base.transaction do
          track_deletion
        end
        @msg = "Successfully Audited the Deletion of #{@auditable.class.to_s}"
      rescue Exception => e
        @success = false
        @msg =  "Audit failed to save due to error: #{e.inspect}"
      end
      return {success: @success, message: @msg}
    end
  end
end
