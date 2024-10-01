require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should be valid" do
    user = User.new(name: "Example User", email: "user@example.com", password: "password123")
    assert user.valid?
  end
end