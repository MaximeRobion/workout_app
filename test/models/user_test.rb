require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "name" do
    assert_equal "John", users(:john).name
  end
end
