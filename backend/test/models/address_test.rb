require "test_helper"

class AddressTest < ActiveSupport::TestCase
  def setup
    @user = User.create!(name: "Test User", email: "test@example.com", password_digest: "password")
    @address = Address.new(user: @user, street: "123 St", city: "City", state: "ST", zip: "12345", country: "Country")
  end

  test "should be valid" do
    assert @address.valid?
  end

  test "should require user" do
    @address.user = nil
    assert_not @address.valid?
  end

  test "should require street" do
    @address.street = nil
    assert_not @address.valid?
  end
end
