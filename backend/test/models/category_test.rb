require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  def setup
    @category = Category.new(name: "Test Category", description: "desc")
  end

  test "should be valid" do
    assert @category.valid?
  end

  test "should require name" do
    @category.name = nil
    assert_not @category.valid?
  end
end
