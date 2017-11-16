require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(password: "testTEST")
    @user.save
    @profile = Profile.new(
                 name: "Justin Drew",
                 email: "justin@justindrew.net",
                 user_id: @user.reload.id
               )

    @profile.save
  end

  test "user is valid" do
    assert @user.valid?
  end

  test "username is accessible" do
    assert_not @user.username.empty?
  end

  test "password is present" do
    assert_not @user.password_digest.empty?
  end

  test "profile exists" do
    assert_not @user.profile.nil?
  end

  test "can find profile by username" do
    u = User.find_by_username("justin@justindrew.net")

    assert_equal @user.id, u.id
  end

end
