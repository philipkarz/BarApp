class CommentsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @review = Review.find(params[:review_id])
    @comment = @review.comments.new
  end

  def create
    @review = Review.find(params[:review_id])
    @comment = @review.comments.new
    @comment.body = params[:comment][:body]
    @comment.user = current_user
    # @comment.review = Review.find params[:comment][:review_id]
    if @comment.save
      redirect_to review_path(@review.id)
    else
      redirect_to new_review_comment_path(@review.id)
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
