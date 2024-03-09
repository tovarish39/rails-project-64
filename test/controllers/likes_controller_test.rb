# frozen_string_literal: true

require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    sign_in users(:one)
    @post = posts(:two)
    @like = post_likes(:one)
  end

  test 'should create like' do
    post post_likes_url(@post)
    assert_response :redirect
  end
  test 'should destroy like' do
    delete like_url(@like)
    assert_response :redirect
  end
end
