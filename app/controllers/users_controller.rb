class UsersController < ApplicationController
  before_action :check_logged_in,   only: [:edit, :update, :destroy]
  before_action :check_logged_out,  only: [:new, :create]

  def index
    @users = policy_scope(User).all
  end

  def new
    @user = User.new
    authorize @user
  end

  def create
    @user = User.new create_params

    authorize @user

    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])

    authorize @user
  end

  def edit
    @user = User.find(params[:id])

    authorize @user
  end

  def update
    @user = User.find(params[:id])

    authorize @user

    if @user.update_attributes update_params
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])

    authorize @user

    if @user.destroy
      redirect_to root_path
    else
      redirect_to user_path(@user)
    end
  end

  private

  def create_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def update_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

  def check_logged_in
    redirect_to new_session_path unless current_user
  end

  def check_logged_out
    redirect_to user_path(current_user) if current_user
  end
end
