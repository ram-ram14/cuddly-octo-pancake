# The UsersController class is inherited from the other

class UsersController < ApplicationController

  # Retrieves the users from the database and assigns them an instance variable
  def index
    @users = User.all
  end

  # Finds a specific user by their respective ID in the database and assigns them to an instance variable
  def show
    @user = User.find(params[:id])
  end

  # Same as above
  def edit
    @user = User.find(params[:id])
  end

  # Creates a new user and assigns it to an instance variable.
  def new
    @user = User.new
  end

  # Creates a new user with the user_params and assigns it to an instance variable. 
  # If the user is saved in the database correctly, the user is logged on to the site and redirected to the root path. Otherwise, the new page is rendered for them again. 

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  # Finds a specific user through their ID in the database and updates it with the user_params
  # If the user is successfully updated, the user is redirected to the show page. Otherwise, they are taken to the edit page. 

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  # Finds a specific user through their ID in the database and removes it. 
  # The user is taken to the users_path. 

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

end

  # Permits specific attributes to be saved

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
