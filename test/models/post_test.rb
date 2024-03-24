# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  body        :text
#  likes_count :integer          default(0)
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#  user_id     :integer
#
# Indexes
#
#  index_posts_on_category_id  (category_id)
#  index_posts_on_user_id      (user_id)
#
# Foreign Keys
#
#  category_id  (category_id => categories.id)
#  user_id      (user_id => users.id)
#
require 'test_helper'

class PostTest < ActiveSupport::TestCase
  setup do
    @creator = users(:one)
    @category = categories(:one)
    @post = Post.new(
      creator: @creator,
      category: @category
    )
    @valid_body = 'valid body' * 11
    @valid_title = 'valid title'
  end
  test 'check :title' do
    @post.body = @valid_body

    @post.title = 'i' * 4
    assert { !@post.valid? } # minimum 5 characters

    @post.title = 'i' * 5
    assert { @post.valid? } # valid

    @post.title = 'i' * 255
    assert { @post.valid? } # valid

    @post.title = 'i' * 256
    assert { !@post.valid? } # maximum 255 characters
  end

  test 'check :body' do
    @post.title = @valid_title

    @post.body = 'i' * 99
    assert { !@post.valid? } # minimum 100 characters

    @post.body = 'i' * 100
    assert { @post.valid? } # valid

    @post.body = 'i' * 4000
    assert { @post.valid? } # valid

    @post.body = 'i' * 4001
    assert { !@post.valid? } # maximum 4000 characters
  end
  test 'check associations' do
    post = Post.new(
      title: @valid_title,
      body: @valid_body
    )

    assert { !post.save }

    post.creator = @creator
    assert { !post.save }

    post.category = @category
    assert { post.save }

    assert { post.comments }
    assert { post.likes }
  end
end
