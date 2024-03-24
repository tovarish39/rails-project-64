# frozen_string_literal: true

require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @post = posts(:two)
    @user_with_post_like = users(:one)
    @user_without_post_like = users(:two)
  end

  test 'should create like' do
    sign_in @user_without_post_like

    current_user_like_before = PostLike.find_by(user: @user_without_post_like)
    assert { current_user_like_before.nil? }

    post post_likes_url(@post)

    current_user_like_after = PostLike.find_by(user: @user_without_post_like)
    assert { current_user_like_after.present? }

    assert_response :redirect
  end

  test 'should destroy like' do
    sign_in @user_with_post_like

    current_user_like_before = PostLike.find_by(user: @user_with_post_like)
    assert { current_user_like_before.present? }

    delete post_like_url(post_id: current_user_like_before.post.id, id: current_user_like_before.id)

    current_user_like_after = PostLike.find_by(user: @user_with_post_like)
    assert { current_user_like_after.nil? }

    assert_response :redirect
  end

  test 'should not create or destroy like by not authorized user' do
    likes_count_before = PostLike.count
    post post_likes_url(@post)
    likes_count_after = PostLike.count
    assert { likes_count_before == likes_count_after }
  end
end
