class CommentsController < ApplicationController
  def index
  end

  def show
    @comment = Comment.find(params[:id])
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
    @comment = Comment.find(params[:id])
    @review = Review.find(params[:review_id])

  end

  def update
  @comment = Comment.find(params[:id])
  @comment.update(comment_params)
  @review = Review.find(params[:review_id])
  if @comment.save 
    flash[:success] = "Comment Updated"
    redirect_to review_path(@review)
  end
end

  def destroy
    @comment = Comment.find(params[:id])
    @review = @comment.review
    @comment.destroy
    flash[:danger] = "Comment Deleted"
    redirect_to review_path(@review)
  end

  private
  def comment_params 
    params.require(:comment).permit(:body, :user_id, :review_id)
  end


end
