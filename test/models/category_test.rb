require "test_helper"

class CategoryTest < ActiveSupport::TestCase

  test "Find by name 'Donations'" do
    category = Category.find_by(name: "Donations")
    assert_equal("Donations", category.name)
  end

  test "Find by description" do
    category = Category.find_by(description: "Maintenance and repair expenses for equipment")
    assert_equal("Maintenance and repair expenses for equipment", category.description)
  end

  test "Category name presence" do
    new_category = Category.new(description: "New category description")
    assert_not(new_category.valid?)
  end

  test "Category name blank" do
    new_category = Category.new(name: "", description: "New category description")
    assert_not(new_category.valid?)
  end


  test "Category name uniqueness" do
    duplicate_category = Category.new(name: "Donations", description: "New category description")
    assert_not(duplicate_category.valid?)
    assert_equal ['has already been taken'], duplicate_category.errors[:name]
  end

  test "Category description presence" do
    new_category = Category.new(name: "New category")
    assert_not(new_category.valid?)
  end

  test "Operations association with category" do
    category = Category.find_by(name: "Donations")
    assert_respond_to category, :operations
  end

end
