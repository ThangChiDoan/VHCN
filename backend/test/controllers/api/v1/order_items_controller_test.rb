require "test_helper"

module Api
  module V1
    class OrderItemsControllerTest < ActionDispatch::IntegrationTest
      def setup
        @category = Category.create!(name: "Test Category", description: "desc")
        @product = Product.create!(name: "Test Product", description: "desc", price: 10.0, stock: 5, category: @category)
        @user = User.create!(name: "Test User", email: "test@example.com", password_digest: "password")
        @address = Address.create!(user: @user, street: "123 St", city: "City", state: "ST", zip: "12345", country: "Country")
        @order = Order.create!(user: @user, address: @address, total: 100.0, status: "pending")
        @order_item = OrderItem.create!(order: @order, product: @product, quantity: 2, price: 20.0)
      end

      test "should get index" do
        get api_v1_order_items_url
        assert_response :success
      end

      test "should show order_item" do
        get api_v1_order_item_url(@order_item)
        assert_response :success
      end

      test "should create order_item" do
        assert_difference('OrderItem.count') do
          post api_v1_order_items_url, params: { order_item: { order_id: @order.id, product_id: @product.id, quantity: 1, price: 10.0 } }
        end
        assert_response :created
      end

      test "should update order_item" do
        patch api_v1_order_item_url(@order_item), params: { order_item: { quantity: 3 } }
        assert_response :success
      end

      test "should destroy order_item" do
        assert_difference('OrderItem.count', -1) do
          delete api_v1_order_item_url(@order_item)
        end
        assert_response :no_content
      end
    end
  end
end
