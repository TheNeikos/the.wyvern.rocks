class SessionsController < ApplicationController
  before_action :check_logged_in,  except:  [:show, :destroy]
  before_action :check_logged_out,   only:  [:show, :destroy]

  def new
    @user = User.new
    authorize @user
  end

  def create
    @user = User.find_by_email(create_params[:email])

    authorize @user

    if @user.try!(:verified_email) and @user.authenticate(create_params[:password])
      sess = @user.sessions.create ip: request.remote_ip
      session[:sess_id] = sess.id
      session[:user_id] = @user.id
      redirect_to root_path
    else
      @user ||= User.new create_params
      @user.errors.add(:base, "Password and E-Mail do not match")
      render :new
    end
  end

  def show
    @user = current_user
    authorize @user
  end

  def destroy
    if params[:sess_id].nil?
      authorize current_user.sessions.find(session[:sess_id])
      session.delete :sess_id
      session.delete :user_id

      redirect_to new_session_path
    else
      session = current_user.sessions.find(params[:sess_id])
      authorize session

      unless session.nil?
        session.destroy
      end

      redirect_to session_path
    end
  end

  private

  def create_params
    params.require(:user).permit(:email, :password)
  end
end
