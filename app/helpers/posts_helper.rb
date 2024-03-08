# frozen_string_literal: true

module PostsHelper
  def my_like_by(post, user)
    return nil if user.nil?

    PostLike.find_by(user:, post:)
  end
end
