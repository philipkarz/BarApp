class ReviewsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @review = Review.new
  
  end

  def create
    @review = Review.new
    @review.title = params[:review][:title]
    @review.body = params[:review][:body]
    @review.rating = params[:review][:rating]
    @review.user = User.find session[:user_id]
    @review.bar = Bar.find(session[:bar_id])
    if @review.save
        redirect_to root_path
    else
        render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
