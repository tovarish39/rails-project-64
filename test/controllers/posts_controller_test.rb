# # frozen_string_literal: true

# require 'test_helper'

# class PostsControllerTest < ActionDispatch::IntegrationTest
#   include Devise::Test::IntegrationHelpers
#   setup do
#     sign_in users(:one)
#     @post_invalid = posts(:not_valid_title)
#     @post_valid = posts(:valid_all)
#   end

#   test 'should get index' do
#     get posts_url
#     assert_response :success
#   end

#   test 'should get new' do
#     get new_post_path
#     assert_response :success
#   end

#   test 'should create post' do
#     post = @post_valid
#     assert_difference('Post.count') do
#       post posts_url, params: { post: { body: post.body, title: post.title, category_id: post.category_id } }
#     end

#     assert_redirected_to post_url(Post.last)
#   end

#   test 'should get error when create invalid post ' do
#     post = @post_invalid
#     post posts_url, params: { post: { body: post.body, title: post.title, category_id: post.category_id } }

#     assert_response :unprocessable_entity
#   end

#   test 'should show post' do
#     get post_path(@post_valid)
#     assert_response :success
#   end

#   test 'should get edit' do
#     get edit_post_url(@post_valid)
#     assert_response :success
#   end

#   test 'should update post' do
#     patch post_url(@post_valid), params: { post: { body: @post_valid.body, title: @post_valid.title } }
#     assert_redirected_to post_url(@post_valid)
#   end

#   test 'should destroy post' do
#     assert_difference('Post.count', -1) do
#       delete post_url(@post_valid)
#     end

#     assert_redirected_to posts_url
#   end
# end
