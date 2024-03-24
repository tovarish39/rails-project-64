# frozen_string_literal: true

# == Schema Information
#
# Table name: post_comments
#
#  id         :integer          not null, primary key
#  ancestry   :string
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_post_comments_on_ancestry  (ancestry)
#  index_post_comments_on_content   (content)
#  index_post_comments_on_post_id   (post_id)
#  index_post_comments_on_user_id   (user_id)
#
# Foreign Keys
#
#  post_id  (post_id => posts.id)
#  user_id  (user_id => users.id)
#
require 'test_helper'

class PostCommentTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
    @post = posts(:one)
    @comment = PostComment.new(
      user: @user,
      post: @post
    )
  end
  test 'check :content' do
    @comment.content = 'i' * 9
    assert { !@comment.valid? } # minimum 10 characters

    @comment.content = 'i' * 10
    assert { @comment.valid? } # valid

    @comment.content = 'i' * 400
    assert { @comment.valid? } # valid

    @comment.content = 'i' * 401
    assert { !@comment.valid? } # maximum 400 characters
  end

  test 'check associations' do
    comment = PostComment.new(content: 'valid content')

    assert { !comment.save }

    comment.user = @user
    assert { !comment.save }

    comment.post = @post
    assert { comment.save }
  end
end
