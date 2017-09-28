class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
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
        redirect_to bars_path
    else
        render :new
    end
  end

  def edit
    @review = Review.find(params[:id])

  end

  def update
    @review = Review.update(review_params)
    redirect_to review_path(@review)

  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to reviews_path
  end

  private
  def review_params
    params.require(:review).permit(:body, :user_id, :bar_id, :title, :rating)
  end
end
