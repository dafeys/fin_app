require "test_helper"

class OperationTest < ActiveSupport::TestCase

  # def setup 
  # end

  test "Find by description" do
    operation = Operation.find_by(description: "Sample operation 1")
    assert_equal("Sample operation 1", operation.description)
  end

  test "Amount should be present" do
    new_operation = Operation.new(  
      odate: Time.now,
      description: "New operation",
      category: Category.find_by(name: "Donations")
    )
    assert_not(new_operation.valid?)
  end

  test "Amount should be greater than 0.01" do
    new_operation = Operation.new(  
      amount: 0.005,
      odate: Time.now,
      description: "New operation",
      category: Category.find_by(name: "Donations")
    )
    assert_not(new_operation.valid?)
  end

  test "Amount equal to 0.01" do
    new_operation = Operation.new(  
      amount: 0.01,
      odate: Time.now,
      description: "New operation",
      category: Category.find_by(name: "Donations")
    )
    assert(new_operation.valid?)
  end

  test "odate should be present" do
    new_operation = Operation.new(  
      amount: 200,
      description: "New operation",
      category: Category.find_by(name: "Donations")
    )
    assert_not(new_operation.valid?)
  end

  test "Description should be present" do
    new_operation = Operation.new(  
      amount: 200,
      odate: Time.now,
      category: Category.find_by(name: "Donations")
    )
    assert_not(new_operation.valid?)
  end

  test "Category association" do
    new_operation = Operation.new(  
      amount: 200,
      odate: Time.now,
      category: Category.find_by(name: "Donations")
    )
    assert_respond_to new_operation, :category
  end

  test "Operation paginate" do
    assert_equal 10, Operation.default_per_page
  end

end
