require 'test_helper'

class AuditTest < ActiveSupport::TestCase
  def setup
    @user = User.create(password: "testTEST")
    @user.save

    @profile = Profile.create(
                 name: "Justin Drew",
                 email: "justin@justindrew.net",
                 user_id: @user.reload.id
               )
    @profile.save

    @group = Group.create(
               name: "Test Group",
               description: "Test Description"
             )
    @group.save

    @membership = Membership.create(
                    group_id: @group.reload.id,
                    profile_id: @profile.reload.id
                  )
    @membership.save

    @audit = Audit.create(
               action: "INSERT",
               auditable_id: @group.id,
               auditable_type: "Group",
               column_name: "name",
               previous_value: nil,
               current_value: "Test Group",
               profile_id: @profile.id
             )
    @audit.save
  end

  test "audit is valid" do
    assert @audit.valid?
  end

  test "action cannot be empty" do
    @audit.action = ""

    assert_not @audit.valid?
  end

  test "action cannot be nil" do
    @audit.action = nil

    assert_not @audit.valid?
  end

  test "action must be one of INSERT, UPDATE, DELETE" do
    valid_actions = %w(INSERT UPDATE DELETE)

    valid_actions.each do |valid_action|
      @audit.action = valid_action
      assert @audit.valid?, "#{valid_action.inspect} should be valid"
    end
  end

  test "action validation should reject invalid values" do
    invalid_actions = %w(UNDATE IMPSERT DACHEATED DEBETE DELTETED ASVWERFASEF)

    invalid_actions.each do |invalid_action|
      @audit.action = invalid_action
      assert_not @audit.valid?, "#{invalid_action.inspect} should be invalid"
    end
  end
end
