require "test_helper"

module Api
  module V1
    class ProductsControllerTest < ActionDispatch::IntegrationTest
      def setup
        @category = Category.create!(name: "Test Category", description: "desc")
        @product = Product.create!(name: "Test Product", description: "desc", price: 10.0, stock: 5, category: @category)
      end

      test "should get index" do
        get api_v1_products_url
        assert_response :success
      end

      test "should show product" do
        get api_v1_product_url(@product)
        assert_response :success
      end

      test "should create product" do
        assert_difference('Product.count') do
          post api_v1_products_url, params: { product: { name: "New Product", description: "desc", price: 20.0, stock: 10, category_id: @category.id } }
        end
        assert_response :created
      end

      test "should update product" do
        patch api_v1_product_url(@product), params: { product: { name: "Updated" } }
        assert_response :success
      end

      test "should destroy product" do
        assert_difference('Product.count', -1) do
          delete api_v1_product_url(@product)
        end
        assert_response :no_content
      end
    end
  end
end
