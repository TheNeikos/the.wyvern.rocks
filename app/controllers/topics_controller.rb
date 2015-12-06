class TopicsController < ApplicationController
  before_action :load_category, only: [:new, :create]
  def new
    @topic = @category.topics.build
    authorize @topic
  end

  def create
    @topic = @category.topics.build create_params
    authorize @topic

    @topic.user = current_user

    if @topic.save
      redirect_to @topic
    else
      render :new
    end
  end

  def edit
    @topic = Topic.find params[:id]
    authorize @topic
  end

  def update
    @topic = Topic.find params[:id]
    authorize @topic

    if @topic.update update_params
      redirect_to @topic
    else
      render :edit
    end
  end

  def destroy
    @topic = Topic.find params[:id]
    authorize @topic

    if @topic.destroy
      redirect_to @topic.category
    else
      redirect_to @topic
    end
  end

  def show
    @topic = Topic.find params[:id]
    authorize @topic
    @user_can_reply = policy(@topic.posts.build).new?
  end

  private

  def load_category
    @category = Category.find params[:category_id]
    authorize @category, :show?
  end

  def create_params
    params.require(:topic).permit(:name)
  end

  def update_params
    params.require(:topic).permit(:name)
  end
end
