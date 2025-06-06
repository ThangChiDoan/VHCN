require "test_helper"

module Api
  module V1
    class OrdersControllerTest < ActionDispatch::IntegrationTest
      def setup
        @user = User.create!(name: "Test User", email: "test@example.com", password_digest: "password")
        @address = Address.create!(user: @user, street: "123 St", city: "City", state: "ST", zip: "12345", country: "Country")
        @order = Order.create!(user: @user, address: @address, total: 100.0, status: "pending")
      end

      test "should get index" do
        get api_v1_orders_url
        assert_response :success
      end

      test "should show order" do
        get api_v1_order_url(@order)
        assert_response :success
      end

      test "should create order" do
        assert_difference('Order.count') do
          post api_v1_orders_url, params: { order: { user_id: @user.id, address_id: @address.id, total: 50.0, status: "pending" } }
        end
        assert_response :created
      end

      test "should update order" do
        patch api_v1_order_url(@order), params: { order: { status: "completed" } }
        assert_response :success
      end

      test "should destroy order" do
        assert_difference('Order.count', -1) do
          delete api_v1_order_url(@order)
        end
        assert_response :no_content
      end
    end
  end
end
