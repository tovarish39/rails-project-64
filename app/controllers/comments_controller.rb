# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    post = Post.find(params[:post_id])
    comment = post.comments.new(params_comment)
    comment.user = current_user

    if comment.save
      flash[:notice] = notice_create
    else
      flash[:alert] = alert_create
    end

    redirect_to post
  end

  private

  def notice_create
    t('comment.notice.success_created')
  end

  def alert_create
    t('comment.notice.failed_created', min_length: ENV.fetch('COMMENT_LENGTH_MIN', 10),
                                       max_length: ENV.fetch('COMMENT_LENGTH_MAX', 400))
  end

  def params_comment
    params.require(:post_comment).permit(:content, :parent_id)
  end
end
