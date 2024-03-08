class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    post = Post.find(params[:post_id])
    comment = post.comments.new(params_comment)
    comment.user = current_user
    comment.save

    redirect_to post
  end

  def update
    comment = PostComment.find(params[:id])
    post = comment.post
    comment.content = params[:post_comment][:content]
    comment.save

    redirect_to post
  end

  def destroy
    comment = PostComment.find(params[:id])
    post = comment.post
    comment.destroy

    redirect_to post
  end

  private

  def params_comment
    params.require(:post_comment).permit(:content, :parent_id)
  end
end
