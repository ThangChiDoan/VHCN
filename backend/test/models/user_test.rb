require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Test User", email: "test@example.com", password_digest: "password")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "should require email" do
    @user.email = nil
    assert_not @user.valid?
  end

  test "should require name" do
    @user.name = nil
    assert_not @user.valid?
  end
end
