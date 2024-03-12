# frozen_string_literal: true

require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @post = posts(:two)
    @like = post_likes(:one)
  end

  test 'should create like' do
    sign_in users(:one)
    post post_likes_url(@post)
    assert_response :redirect
  end
  test 'should destroy like' do
    sign_in users(:one)
    delete post_like_url(post_id: @like.post.id, id: @like.id)
    assert_response :redirect
  end

  test 'should not destroy like by not authorized user' do
    post post_likes_url(@post)
    assert_response :redirect
  end
end
