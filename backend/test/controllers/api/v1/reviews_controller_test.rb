require "test_helper"

module Api
  module V1
    class ReviewsControllerTest < ActionDispatch::IntegrationTest
      def setup
        @category = Category.create!(name: "Test Category", description: "desc")
        @product = Product.create!(name: "Test Product", description: "desc", price: 10.0, stock: 5, category: @category)
        @user = User.create!(name: "Test User", email: "test@example.com", password_digest: "password")
        @review = Review.create!(user: @user, product: @product, rating: 5, comment: "Great!")
      end

      test "should get index" do
        get api_v1_reviews_url
        assert_response :success
      end

      test "should show review" do
        get api_v1_review_url(@review)
        assert_response :success
      end

      test "should create review" do
        assert_difference('Review.count') do
          post api_v1_reviews_url, params: { review: { user_id: @user.id, product_id: @product.id, rating: 4, comment: "Good" } }
        end
        assert_response :created
      end

      test "should update review" do
        patch api_v1_review_url(@review), params: { review: { rating: 3 } }
        assert_response :success
      end

      test "should destroy review" do
        assert_difference('Review.count', -1) do
          delete api_v1_review_url(@review)
        end
        assert_response :no_content
      end
    end
  end
end
