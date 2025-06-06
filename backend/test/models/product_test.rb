require "test_helper"

class ProductTest < ActiveSupport::TestCase
  def setup
    @category = Category.create!(name: "Test Category", description: "desc")
    @product = Product.new(name: "Test Product", description: "desc", price: 10.0, stock: 5, category: @category)
  end

  test "should be valid" do
    assert @product.valid?
  end

  test "should require name" do
    @product.name = nil
    assert_not @product.valid?
  end

  test "should require price" do
    @product.price = nil
    assert_not @product.valid?
  end
end
