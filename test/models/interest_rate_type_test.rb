require 'test_helper'

class InterestRateTypeTest < ActiveSupport::TestCase
  def setup
    @rateType = InterestRateType.new(name: "test")
  end
end
