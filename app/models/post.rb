# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  body        :text
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer          not null
#  user_id     :integer          not null
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

  validates :title, length: { in: 5..255 }
  validates :body, length: { in: 100..4000 }
end
