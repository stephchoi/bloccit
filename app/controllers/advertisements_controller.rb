class AdvertisementsController < ApplicationController
  def index
    @ads = Advertisement.all
  end

  def new
    @ad = Advertisement.new
  end

  def show
    @ad = Advertisement.find(params[:id])
  end

  def create
    @ad = Advertisement.new
    @ad.title = params[:ad][:title]
    @ad.body = params[:ad][:copy]
    @ad.price = params[:ad][:price]
    
    if @ad.save
      flash[:notice] = "Ad was saved."
      redirect_to @ad
    else
      flash.now[:alert] = "There was an error saving the Ad. Please try again."
      render :new
    end
  end
end
