require "test_helper"

module Api
  module V1
    class AddressesControllerTest < ActionDispatch::IntegrationTest
      def setup
        @user = User.create!(name: "Test User", email: "test@example.com", password_digest: "password")
        @address = Address.create!(user: @user, street: "123 St", city: "City", state: "ST", zip: "12345", country: "Country")
      end

      test "should get index" do
        get api_v1_addresses_url
        assert_response :success
      end

      test "should show address" do
        get api_v1_address_url(@address)
        assert_response :success
      end

      test "should create address" do
        assert_difference('Address.count') do
          post api_v1_addresses_url, params: { address: { user_id: @user.id, street: "456 St", city: "City", state: "ST", zip: "67890", country: "Country" } }
        end
        assert_response :created
      end

      test "should update address" do
        patch api_v1_address_url(@address), params: { address: { city: "New City" } }
        assert_response :success
      end

      test "should destroy address" do
        assert_difference('Address.count', -1) do
          delete api_v1_address_url(@address)
        end
        assert_response :no_content
      end
    end
  end
end
