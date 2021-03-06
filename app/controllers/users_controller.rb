class UsersController < ApplicationController
  #login only allow 
  before_action :authorize, only: [:edit, :update, :destroy]
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @bars = Bar.all
  end

  def new
    @user = User.new
  end
  
 def create
    @user = User.new(user_params)
    if @user.save
      #logs them in while signing them up
      session[:user_id] = @user.id 
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end
  end

 def edit
  if current_user.id == params[:id].to_i
    @user = User.find(params[:id])
  else
    redirect_to user_path(current_user)
  end
end

 def update
  @user = User.find(params[:id])
  if @user.update_attributes(user_params)
    redirect_to user_path(current_user)
  else
    redirect_to edit_user_path(params[:id])
  end
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
