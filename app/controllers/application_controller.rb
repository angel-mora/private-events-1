class ApplicationController < ActionController::Base
  helper_method :current_user, :already_logged_in?, :already_attendee?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def already_logged_in?
    current_user
  end

  def require_login
    redirect_to root_path unless already_logged_in?
  end

  def already_attendee?
    attendees = @event.attendees
    attendees.include?(current_user)
  end
end
