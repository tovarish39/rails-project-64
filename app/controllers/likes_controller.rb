# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    post = Post.find(params[:post_id])
    PostLike.create(
      post:,
      user: current_user
    )
    # не работает с turbo. без turbo не пробовал
    # redirect_to "#{request.referer}#post_#{post_id}"

    # не работет, так как тесты падают, не редиректит на nil
    # redirect_to request.referer

    redirect_to request.url
  end

  def destroy
    like = PostLike.find(params[:id])
    like.destroy
    # не работает с turbo. без turbo не пробовал
    # redirect_to "#{request.referer}#post_#{post_id}"
    redirect_to request.url
  end
end
