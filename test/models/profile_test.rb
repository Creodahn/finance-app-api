require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  def setup
    @user = User.new(password: "testTEST")
    @user.save
    @profile = Profile.new(
                 name: "Justin Drew",
                 email: "justin@justindrew.net",
                 user_id: @user.reload.id
               )
  end

  test "should be valid" do
    assert @profile.valid?, "profile should be valid"
  end

  test "name should be present" do
    @profile.name = ""
    assert_not @profile.valid?
  end

  test "email should be present" do
    @profile.email = ""
    assert_not @profile.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[justin@justindrew.net user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @profile.email = valid_address
      assert @profile.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com user.name@example]
    invalid_addresses.each do |invalid_address|
      @profile.email = invalid_address
      assert_not @profile.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email should be unique" do
    duplicate_profile = @profile.dup
    duplicate_profile.email = @profile.email.upcase
    @profile.save
    assert_not duplicate_profile.valid?
  end

  test "email should be saved as lowercase" do
    mixed_case_email = "TeSt@ExAmplE.COM"
    @profile.email = mixed_case_email
    @profile.save
    assert_equal mixed_case_email.downcase, @profile.reload.email, "#{mixed_case_email.downcase} should be equal to #{@profile.email}"
  end

  test "user_id should be present" do
    @profile.user_id = nil
    assert_not @profile.valid?
  end

  test "name validation should accept valid names" do
    valid_names = ["John Doe", "Justin Drew", "John Conor", "John O'Connor", "Justin Adam Drew", "Dr. Martin Luther King, Jr."]

    valid_names.each do |valid_name|
      @profile.name = valid_name

      assert @profile.valid?, "#{valid_name} should be valid"
    end
  end

  test "name validation should reject invalid names" do
    invalid_names = ["100101", "NotAN@mE", "gli111tch", " ", "a", "aa", "aaa", "a" * 100 + " "]

    invalid_names.each do |invalid_name|
      @profile.name = invalid_name

      assert_not @profile.valid?, "#{invalid_name} should be invalid"
    end
  end
end
