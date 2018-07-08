require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not comment on todo by expert" do
    @todo = Expert.first.todo_lists.first
    @novice = Novice.first
    @novice.comments.
  end
end
