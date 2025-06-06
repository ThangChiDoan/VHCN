require "test_helper"

class OrderItemTest < ActiveSupport::TestCase
  def setup
    @category = Category.create!(name: "Test Category", description: "desc")
    @product = Product.create!(name: "Test Product", description: "desc", price: 10.0, stock: 5, category: @category)
    @user = User.create!(name: "Test User", email: "test@example.com", password_digest: "password")
    @address = Address.create!(user: @user, street: "123 St", city: "City", state: "ST", zip: "12345", country: "Country")
    @order = Order.create!(user: @user, address: @address, total: 100.0, status: "pending")
    @order_item = OrderItem.new(order: @order, product: @product, quantity: 2, price: 20.0)
  end

  test "should be valid" do
    assert @order_item.valid?
  end

  test "should require order" do
    @order_item.order = nil
    assert_not @order_item.valid?
  end

  test "should require product" do
    @order_item.product = nil
    assert_not @order_item.valid?
  end
end
