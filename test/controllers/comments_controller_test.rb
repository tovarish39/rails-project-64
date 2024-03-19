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
end
