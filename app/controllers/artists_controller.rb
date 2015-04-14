class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @artists = Artist.all
    respond_with(@artists)
  end

  def search
      if !params[:artist_name].empty?
     @artists = RSpotify::Artist.search(params[:artist_name])
   else
     redirect_to root_path
   end
  end
  def show
   # @artist = Artist.find(params[:id])
    if user_signed_in?
      @rating = Rating.where(artist_id: @artist.id, user_id: current_user.id).first 
     # @music_ratings = @artist.musics.map {
      #  |m| get_rating(m)

     # }


  
      unless @rating
       @rating = Rating.create(artist_id: @artist.id, user_id: current_user.id, score: 0) 
     end
   end
  respond_with(@artist)
  end

def like
  @artistToLike = Artist.find(params[:id])
  @artistToLike.liked_by current_user
  redirect_to request.referrer
end
  def new
    @artist = Artist.new
    respond_with(@artist)
  end

  def edit
  end

  def create
    @artist = Artist.new(artist_params)
    @artist.save
    respond_with(@artist)
  end

  def update
    @artist.update(artist_params)
    respond_with(@artist)
  end

  def destroy
    @artist.destroy
    respond_with(@artist)
  end

  private
    def set_artist
      @artist = Artist.find(params[:id])
    end

    def artist_params
      params.require(:artist).permit(:name, :bio)
    end
end
