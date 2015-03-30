class MixtapesController < ApplicationController
  def new
  	@mixtape = Mixtape.new
  end

  def create
  	@mixtape = Mixtape.create(mixtape_params)
  	if @mixtape.save 
    	redirect_to mixtape_path(@mixtape)
    else
    	redirect_to request.referrer, flash: {alert: "Couldn't upload your mixtape, Scratching heads...."}
    end
  end
  def index
  	@mixtapes = Mixtape.all
  end

  def show
  		@mixtape = Mixtape.find(params[:id])
  end
  def destroy 
  	@mixtape = Mixtape.find(params[:id])
  	@mixtape.file = nil
  	@mixtape.save
  end
  private

# Use strong_parameters for attribute whitelisting
# Be sure to update your create() and update() controller methods.

def mixtape_params
  params.require(:mixtape).permit(:file,:name)
end
end