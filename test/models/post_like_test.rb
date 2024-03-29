# frozen_string_literal: true

# == Schema Information
#
# Table name: post_likes
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_post_likes_on_post_id  (post_id)
#  index_post_likes_on_user_id  (user_id)
#
# Foreign Keys
#
#  post_id  (post_id => posts.id)
#  user_id  (user_id => users.id)
#
require 'test_helper'

class PostLikeTest < ActiveSupport::TestCase
  test 'associations' do
    like = PostLike.new

    assert { !like.save }

    like.user = users(:one)
    assert { !like.save }

    like.post = posts(:one)
    assert { like.save }
  end
end
