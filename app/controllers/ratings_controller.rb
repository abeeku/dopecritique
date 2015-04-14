class RatingsController < ApplicationController

  def update
    @rating = Rating.find(params[:id])
    @mixtape = @rating.mixtape if @rating.mixtape
    @artist = @rating.artist if @rating.artist
    

    if @rating.update_attributes(score: params[:score])
      respond_to do |format|
       
        format.js {
        	 
        	 @music = Music.find(id: params[:music_id]).first if params[:music_id]
        	 #render :parial => "update"
        }

      end
    end
  end

end