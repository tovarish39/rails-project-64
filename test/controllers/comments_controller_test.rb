# frozen_string_literal: true

require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    sign_in users(:one)
    @post = posts(:one)
    @comment = post_comments(:nested_nested)
    @comment_root = post_comments(:root)
  end

  test 'should create comment' do
    new_comment_content = 'some comment content'
    post post_comments_url(@post), params: { post_comment: { content: new_comment_content } }
    new_comment = @post.comments.find_by(content: new_comment_content)

    assert { new_comment.present? }
  end
end
