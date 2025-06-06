require "test_helper"

class OrderTest < ActiveSupport::TestCase
  def setup
    @user = User.create!(name: "Test User", email: "test@example.com", password_digest: "password")
    @address = Address.create!(user: @user, street: "123 St", city: "City", state: "ST", zip: "12345", country: "Country")
    @order = Order.new(user: @user, address: @address, total: 100.0, status: "pending")
  end

  test "should be valid" do
    assert @order.valid?
  end

  test "should require user" do
    @order.user = nil
    assert_not @order.valid?
  end

  test "should require address" do
    @order.address = nil
    assert_not @order.valid?
  end
end
