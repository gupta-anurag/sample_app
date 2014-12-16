require 'test_helper'

class CommentsTest < ActiveSupport::TestCase
  
  def setup
    @user = users(:michael)
    @comment = @user.comment.build(content: "Lorem ipsum")

  end

  test "content should be present " do
    @comment.content = "   "
    assert_not @comment.valid?
  end

  test "content should be at most 140 characters" do
    @comment.content = "a" * 141
    assert_not @comment.valid?
  end

  test "order should be most recent first" do
  	assert_equal Comment.first, comment(:most_recent)
  end	
end
end
