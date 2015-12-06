class PostsController < ApplicationController
  before_action :load_topic, only: [:new, :create]
  def new
    @post = @topic.posts.build
    authorize @post
  end

  def create
    @post = @topic.posts.build create_params
    authorize @post
    @post.user = current_user

    if @post.save
      redirect_to @post
    else
      byebug
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    authorize @post
  end

  def update
    @post = Post.find(params[:id])
    authorize @post

    if @post.update(update_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    authorize @post

    @post.destroy
  end

  def show
    @post = Post.find(params[:id])
    authorize @post

    redirect_to topic_path(@post.topic, anchor: @post.anchor)
  end

  private

  def create_params
    params.require(:post).permit(:content, :type)
  end

  def update_params
    params.require(:post).permit(:content)
  end

  def load_topic
    @topic = Topic.find(params[:topic_id])
  end
end
