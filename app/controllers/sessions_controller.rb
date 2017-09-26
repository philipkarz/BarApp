class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    #if user email and password matches
    if @user and @user.authenticate(params[:password])
      #log them in and keep them logged in 
      #'session' is the value = 'user_id' is what the value
      #is being assigned to
  session[:user_id] = @user.id
  redirect_to user_path(@user)
    else 
      flash[:danger] = 'Incorrect email or password'
      redirect_to new_session_path
  end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end

