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
      flash[:alert] =
        t('comment.notice.failed_created', min_length: ENV.fetch('COMMENT_LENGTH_MIN', 10),
                                           max_length: ENV.fetch('COMMENT_LENGTH_MAX', 400))
    end

    redirect_to post
  end

  private

  def params_comment
    params.require(:post_comment).permit(:content, :parent_id)
  end
end
