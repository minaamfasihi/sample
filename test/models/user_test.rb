require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save without email" do
    user = User.new(status: "qualified", password: "112233", actable_type: "Expert", actable_id: 1, username: "dolly")
    assert user.save
  end
end
