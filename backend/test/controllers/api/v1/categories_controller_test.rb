require "test_helper"

module Api
  module V1
    class CategoriesControllerTest < ActionDispatch::IntegrationTest
      def setup
        @category = Category.create!(name: "Test Category", description: "desc")
      end

      test "should get index" do
        get api_v1_categories_url
        assert_response :success
      end

      test "should show category" do
        get api_v1_category_url(@category)
        assert_response :success
      end

      test "should create category" do
        assert_difference('Category.count') do
          post api_v1_categories_url, params: { category: { name: "New Category", description: "desc" } }
        end
        assert_response :created
      end

      test "should update category" do
        patch api_v1_category_url(@category), params: { category: { name: "Updated" } }
        assert_response :success
      end

      test "should destroy category" do
        assert_difference('Category.count', -1) do
          delete api_v1_category_url(@category)
        end
        assert_response :no_content
      end
    end
  end
end
