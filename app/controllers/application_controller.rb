class ApplicationController < ActionController::Base
    helper_method :current_user, :already_logged_in?, :already_attendee?
    

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def already_logged_in?
        current_user
    end

    def require_login
        redirect_to root_path
        flash[:notice] = 'You must be logged in to continue'        
    end

    def already_attendee?
        
    end
end
