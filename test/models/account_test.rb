require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  def setup
    @user = User.new(password: "testTEST")
    @user.save
    @profile = Profile.new(
                 name: "Justin Drew",
                 email: "justin@justindrew.net",
                 user_id: @user.reload.id
               )
    @profile.save

    @accountType = AccountType.new(name: "Credit Card")
    @accountType.save

    @account = Account.new(
                 account_number: "00000",
                 balance: "500.00",
                 description: "Test account",
                 name: "Test Account",
                 account_type_id: @accountType.reload.id,
                 profile_id: @profile.reload.id
               )
    @account.save
  end

  test "account is valid" do
    assert @account.valid?
  end

  test "account_number is required" do
    @account.account_number = ""
    assert_not @account.valid?
  end

  test "balance is required" do
    @account.balance = ""
    assert_not @account.valid?
  end

  test "name is required" do
    @account.name = ""
    assert_not @account.valid?
  end

  test "account_type is required" do
    @account.account_type_id = nil
    assert_not @account.valid?
  end

  test "profile is required" do
    @account.profile_id = nil
    assert_not @account.valid?
  end
end
