class UsersController < ApplicationController
  # Checks that the current user is an admin before offering access to the index action. 
  # If the user is not an admin, they are redirected to the login page.
  before_action :check_for_admin, :only => [:index]

  # Retrieves all of the users from the database and assigns them an instance variable, which is used to display a list of users on the index page. 
  def index
    @users = User.all
  end

  # Displays a form for creating a new user. 
  def new
    @user = User.new
  end

  # When the user submits the new user form, it creates a new user object from the submitted parameters and saves it into the database. 
  def create
    @user = User.new user_params
    # If the user is saved successfully, they are redirected to the root path. 
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    # If they fail, the form is rendered again to show relevant error messages. 
    else
      render :new
    end
  end

  private

  # A private method specifying the parameters that are allowed to be submitted by users in the form. 
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end