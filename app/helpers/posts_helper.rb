# frozen_string_literal: true

module PostsHelper
  def my_like_by(post, user)
    return nil if user.nil?

    PostLike.find_by(user:, post:)
  end

  def sliced_body(text)
    sliced = text.slice(0, 200)
    sliced.size < text.size ? "#{sliced}..." : text
  end
end
