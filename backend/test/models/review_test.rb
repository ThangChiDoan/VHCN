require "test_helper"

class ReviewTest < ActiveSupport::TestCase
  def setup
    @category = Category.create!(name: "Test Category", description: "desc")
    @product = Product.create!(name: "Test Product", description: "desc", price: 10.0, stock: 5, category: @category)
    @user = User.create!(name: "Test User", email: "test@example.com", password_digest: "password")
    @review = Review.new(user: @user, product: @product, rating: 5, comment: "Great!")
  end

  test "should be valid" do
    assert @review.valid?
  end

  test "should require user" do
    @review.user = nil
    assert_not @review.valid?
  end

  test "should require product" do
    @review.product = nil
    assert_not @review.valid?
  end
end
