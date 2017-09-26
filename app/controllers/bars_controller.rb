class BarsController < ApplicationController
  def index
    @bars = Bar.all
  end

  def show
    @bar = Bar.find(params[:id])
  end

  def new
    @new_bar = Bar.new
  end
  
  # @bar = Bar.new
    # @bar.name = params[:bar][:name]
    # @bar.address = params[:bar][:address]
    # @bar.number = params[:bar][:number]
    # @bar.hours = params[:bar][:hours]
    # @bar.photos = params[:bar][:photos]
    # @bar.website = params[:bar][:website]
    # @bar.games = params[:bar][:games]
    # @bar.wifi = params[:bar][:wifi]
    # @bar.reservations = params[:bar][:reservations]
    # @bar.happyhour = params[:bar][:happyhour]
    def create
      @bar = current_user.bars.new(bar_params)
      if @bar.save
        redirect_to bar_path(@bar)
      else
        redirect_to new_bar_path
      
    end
    
   

    def edit
    end

    def update
    end

    def destroy
    end
    
    private
    
    def user_params
    params.require(:bar).permit(:name, :address, :number, :hours, :photos, 
    :website, :games, :wifi, :reservations, :happyhour)
  end
end
end
