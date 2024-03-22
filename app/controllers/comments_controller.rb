# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    post = Post.find(params[:post_id])
    comment = post.comments.new(params_comment)
    comment.user = current_user

    if comment.save
      flash[:notice] = t('comment.notice.success_created')
    else
      flash[:alert] = comment.errors[:content].first
    end

    redirect_to post
  end

  private

  def params_comment
    params.require(:post_comment).permit(:content, :parent_id)
  end
end
