module UsersHelper
  def current_user
    @__current_user ||= Session.find_by_id(session[:sess_id]).try!(:user)
  end

  def logged_in?
    !current_user.nil?
  end
end
