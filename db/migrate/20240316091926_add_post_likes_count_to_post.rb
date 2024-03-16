# frozen_string_literal: true

class AddPostLikesCountToPost < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :post_likes_count, :integer
  end
end
