require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  test "shud create new category" do
    cat = Category.new(name: 'First category', description: 'Category first')
    cat.save
    assert true
  end
end
