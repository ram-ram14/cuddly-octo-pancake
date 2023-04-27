# Base class for all controllers in the application. 
class ApplicationController < ActionController::Base
    before_action :fetch_user
    
    private
    # Retrieves the current user from the session and assigns it to an instance variable. The session resets if no user is found.
    def fetch_user
        @current_user = User.find_by :id => session[:user_id]
        session[:user_id] = nil unless @current_user.present?
    end
    # If the user is not logged in, they are redirected to the login page.
    def check_for_login
        redirect_to login_path unless @current_user.present?
    end
    # If the user is not an admin, it redirects to the login page.
    def check_for_admin
        redirect_to login_path unless (@current_user.present? && @current_user.admin?)
    end
end
