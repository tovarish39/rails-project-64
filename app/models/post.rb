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
class Post < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: :user_id, inverse_of: :posts
  belongs_to :category
  has_many :comments, class_name: 'PostComment', dependent: :destroy
  has_many :likes   , class_name: 'PostLike'   , dependent: :destroy # rubocop:disable Layout/SpaceBeforeComma

  validates :title, length: { minimum: 5, maximum: 255 }
  validates :body, length: { minimum: 100, maximum: 4000 }

  attribute :post_likes_count, default: 0
end
