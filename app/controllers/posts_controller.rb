# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def index
    @posts = Post.limit(100).includes(:creator).order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @likes = @post.likes
    @comments = @post.comments.order(created_at: :desc)
    @liked_by_self = @post.likes.any? { |like| like.user == current_user }
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.creator = current_user

    if @post.save
      flash[:notice] = t('post.notice.success_created')
      redirect_to post_url(@post)
    else
      flash[:alert] = t('post.notice.failed_created')
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :category_id)
  end
end
