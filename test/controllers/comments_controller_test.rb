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
    assert_difference('PostComment.count') do
      post post_comments_url(@post), params: { post_comment: { content: 'some content' } }
    end
  end
  test 'should update comment' do
    patch comment_url(@comment_root), params: { post_comment: { content: 'new content' } }
    assert_redirected_to post_url(@comment_root.post)
  end
  test 'should destroy comment' do
    assert_difference('PostComment.count', -1) do
      delete comment_url(@comment)
    end
  end
end
