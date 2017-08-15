require 'test_helper'

class MembershipTest < ActiveSupport::TestCase
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
  end

  test "membership is valid" do
    assert @membership.valid?
  end

  test "group is required" do
    @membership.group_id = nil

    assert_not @membership.valid?
  end

  test "profile is required" do
    @membership.profile_id = nil

    assert_not @membership.valid?
  end
end
