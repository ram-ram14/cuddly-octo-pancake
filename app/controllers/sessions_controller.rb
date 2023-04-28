class SessionsController < ApplicationController

  # This action displays the login form. 
  def new
    end
    
    # A new method for when the user submits the login form. 
    # Authenticates the user by determining whether the given email address and password is correct. 
    def create
      user = User.find_by :email => params[:email]
      if user.present? && user.authenticate(params[:password])
        #  If authentication succeeds, it creates a new session by setting the :user_id key in the session hash to the user's ID and redirects the user to the root path. 
        session[:user_id] = user.id
        redirect_to root_path
      else
        # If authentication fails, it sets an error message in the flash and redirects back to the login page.
        flash[:error] = "Invalid username or password"
        redirect_to login_path
      end
    end
    
    # This method logs out the current user by deleting the :user_id key from the session hash and redirects to the login page.
    def destroy
      session[:user_id] = nil
      redirect_to login_path
    end
  end