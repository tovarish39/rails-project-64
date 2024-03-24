# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    sign_in users(:one)
    @post_invalid = posts(:invalid_title_length)
    @post_valid = posts(:one)
  end

  test 'should get index' do
    get posts_url
    assert_response :success
  end

  test 'should get new' do
    get new_post_path
    assert_response :success
  end

  test 'should create post' do
    title_before = 'title_before'
    title_after = 'title_after'
    @post_valid.title = title_before
    @post_valid.save
    assert { @post_valid.title == title_before }
    assert_difference('Post.count') do
      post posts_url,
           params: { post: { body: @post_valid.body, title: title_after, category_id: @post_valid.category_id } }
    end
    assert { Post.last.title == title_after }

    assert_redirected_to post_url(Post.last)
  end

  test 'should get error when create invalid post ' do
    post = @post_invalid
    post posts_url, params: { post: { body: post.body, title: post.title, category_id: post.category_id } }

    assert_response :unprocessable_entity
  end

  test 'should show post' do
    get post_path(@post_valid)
    assert_response :success
  end
end
