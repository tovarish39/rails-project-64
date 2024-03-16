# frozen_string_literal: true

class LikesController < ApplicationController
  def create
    if current_user
      post = Post.find(params[:post_id])
      PostLike.create(
        post:,
        user: current_user
      )
    end

    redirect_to request.url
  end

  def destroy
    like = PostLike.find(params[:id])
    like.destroy if current_user&.likes&.any?(like)

    redirect_to request.url
  end
end
