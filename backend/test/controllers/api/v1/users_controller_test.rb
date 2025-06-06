require "test_helper"

module Api
  module V1
    class UsersControllerTest < ActionDispatch::IntegrationTest
      def setup
        @user = User.create!(name: "Test User", email: "test@example.com", password_digest: "password")
      end

      test "should get index" do
        get api_v1_users_url
        assert_response :success
      end

      test "should show user" do
        get api_v1_user_url(@user)
        assert_response :success
      end

      test "should create user" do
        assert_difference('User.count') do
          post api_v1_users_url, params: { user: { name: "New User", email: "new@example.com", password_digest: "password" } }
        end
        assert_response :created
      end

      test "should update user" do
        patch api_v1_user_url(@user), params: { user: { name: "Updated" } }
        assert_response :success
      end

      test "should destroy user" do
        assert_difference('User.count', -1) do
          delete api_v1_user_url(@user)
        end
        assert_response :no_content
      end
    end
  end
end
