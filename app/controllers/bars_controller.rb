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
    @bar.photos = params[:bar][:photos]
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
  end

  def update
  end

  def destroy
  end
end
