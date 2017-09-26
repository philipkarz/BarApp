class UsersController < ApplicationController
  #login only allow 
  before_action :authorize, only: [:edit, :update, :destroy]
  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end
  
 def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id #logs them in while signing them up
      redirect_to root_path
    else
      redirect_to new_user_path
    end
  end

 def edit
  end

 def update
  end

 def destroy
  current_user.destroy
  session[:user_id] = nil
  redirect_to root_path

  end
 private
#   #makes sure you cant do things like adding an admin field and making it true
#   #user_params is anything we will use in user#create
def user_params
 params.require(:user).permit(:name, :email, :password, :password_confirmation)
    # password_confirmation makes passwords have to match to be saved
  end
end
