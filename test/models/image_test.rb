require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  def setup
    @user = User.create(password: "testTEST")
    @user.save

    @profile = Profile.create(
                 name: "Justin Drew",
                 email: "justin@justindrew.net",
                 user_id: @user.reload.id
               )
    @profile.save

    @image = Image.create(
               file_name: "me.jpg",
               url: 'http://www.justindrew.net/me.jpg',
               uploader_id: @profile.reload.id,
               imageable_type: "Profile",
               imageable_id: @profile.id
             )
    @image.save
  end

  test "image is valid" do
    assert @image.valid?
  end

  test "uploader must be present" do
    @image.uploader_id = nil
    assert_not @image.valid?
  end

  test "file_name is required" do
    @image.file_name = ""
    assert_not @image.valid?
  end

  test "url is required" do
    @image.url = ""
    assert_not @image.valid?
  end

  test "url must be valid" do
    @image.url = "httr://justindrew.net/me.jpg"
    assert_not @image.valid?
  end
end
