# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id               :integer          not null, primary key
#  body             :text
#  post_likes_count :integer
#  title            :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  category_id      :integer
#  user_id          :integer
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
  # test "the truth" do
  #   assert true
  # end
end
