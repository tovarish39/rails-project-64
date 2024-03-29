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
    title = 'new post title'
    post posts_url,
         params:
          { post:
            { body: 'new post body' * 100, title:, category_id: Category.all.sample.id } }
    created_post = Post.find_by(title:)
    assert { created_post.present? }
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
