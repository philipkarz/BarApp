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
    @bar = Bar.find params[:review][:bar_id]
    @user = User.find params[:review][:user_id]
    @review.bar = @bar
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
