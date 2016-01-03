class ApplicationController < ActionController::Base
  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include UsersHelper

  after_action :verify_authorized, :except => :index
  after_action :verify_policy_scoped, :only => :index


  if not Rails.env.test? then
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  end

  protected

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to root_path
  end

  def check_logged_in
    redirect_to session_path if current_user
  end

  def check_logged_out
    redirect_to new_session_path unless current_user
  end
end
