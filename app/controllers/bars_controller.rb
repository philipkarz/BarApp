class BarsController < ApplicationController
  def index
    @bars = Bar.all
  end

  def show
    @bar = Bar.find(params[:id])
    session[:bar_id] = @bar.id
    @reviews = @bar.reviews.all
    # @comments = @reviews.comments.all
  end

  def new
    @new_bar = Bar.new
  end
  
  def create
    @bar = Bar.new
    @bar.name = params[:bar][:name]
    @bar.address = params[:bar][:address]
    @bar.number = params[:bar][:number]
    @bar.hours = params[:bar][:hours]
    @bar.photo = params[:bar][:photo]
    @bar.website = params[:bar][:website]
    @bar.games = params[:bar][:games]
    @bar.wifi = params[:bar][:wifi]
    @bar.reservations = params[:bar][:reservations]
    @bar.happyhour = params[:bar][:happyhour]
    if @bar.save
      redirect_to bars_path
    else
      redirect_to new_bar_path
    
    end
  end
   

  def edit
    @bar = Bar.find(params[:id])
  end

  def update
    @bar = Bar.find(params[:id])
    @bar.update(bar_params)
      flash[:success] = "Bar Updated"
      redirect_to bar_path(@bar)
  end
    

  def destroy
    @bar = Bar.find(params[:id])
    @bar.destroy
    flash[:warning] = "Bar Removed"
    redirect_to bars_path
  end

  def search
    @bars = Bar.where("name ILIKE :query", { query: "%#{params[:query]}%"})
  end
  
  private
  def bar_params 
    params.require(:bar).permit(:name, :user_id, :review_id, :hours, :address, 
    :number, :photo, :website, :games, :wifi, :reservations, :happyhour)
  end
end
