class FavoritesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @bar = Bar.find(params[:bar_name])
    @favorite = Favorite.new
  end

  def create

    @bar = Bar.find(params[:id])
    # current_user.favorites.create(bar: @bar)

    if Favorite.where(bar: @bar, user: current_user).length > 0
      flash[:warning] = "You've already favorited that bar!"
    else
      @favorite = current_user.favorites.new(bar: @bar)
      if @favorite.save
        flash[:primary] = "Added #{@bar.name} to your favorites!"
      else
        flash[:danger] = "There was a problem saving the favorite."
      end  
    end

    
    redirect_to bar_path(@bar)

  end

  def edit
  end

  def update
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    if @favorite.destroy
      # flash[:warning] = "Are you sure you want to delete?"
      flash[:warning] = "Favorite deleted"
      redirect_to user_path(current_user)
    else
      flash[:danger] = "Couldnt delete from favorites"
    end
  end
end
