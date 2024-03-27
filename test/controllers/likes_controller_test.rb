# frozen_string_literal: true

require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @post = posts(:two)
    @post_with_like = posts(:one)
    @user_with_post_like = users(:one)
    @user_without_post_like = users(:two)
  end

  test 'should create like' do
    sign_in @user_without_post_like

    assert_difference('PostLike.count') do
      post post_likes_url(@post)
    end
  end

  # test 'should destroy like' do
  #   sign_in @user_with_post_like
  #   like = @user_with_post_like.likes.first
  #   like_id = like.id
  #   delete post_like_url(post_id: like.post.id, id: like_id)

  #   assert { PostLike.find_by(id: like_id).nil? }
  # end
  test 'should get destroy' do
    sign_in @user_with_post_like

    post_id = @post_with_like.id
    id = PostLike.find_by(post_id:, user: @user_with_post_like)&.id

    delete post_like_url(post_id:, id:)

    deleted_post_like = PostLike.find_by(id:)

    assert_nil(deleted_post_like)
  end

  test 'should not create or destroy like by not authorized user' do
    likes_count_before = PostLike.count
    post post_likes_url(@post)
    likes_count_after = PostLike.count
    assert { likes_count_before == likes_count_after }
  end
end
