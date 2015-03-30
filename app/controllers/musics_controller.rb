class MusicsController < ApplicationController
	 respond_to :html, :xml, :json
   before_action :set_artist

#	def index
 #   @musics = Music.all
  #  respond_with(@musics)
 # end

  #def show
   # respond_with(@music)
  #end

  #def new
   # @music = Music.new
    #respond_with(@music)
  #end

  #def edit
  #end

  def create
    @music = @artist.musics.create(music_params)
    redirect_to @artist
  end

  #def update
   # @music.update(music_params)
    #respond_with(@music)
  #end
def like
  @musicToLike = Music.find(params[:id])
  @musicToLike.liked_by current_user
 @musicToLike.artist.liked_by current_user
 @musicToLike.save
 @musicToLike.artist.save
  redirect_to request.referrer
end
  def destroy
    @music = @artist.musics.find(params[:id])
    if @music.destroy
        flash[:success] = "Item deleted"
      else
        flash[:error] = "Couldn't delete item"
        
    end
    redirect_to @artist
  end


  private
    def set_music
      @music = Music.find(params[:id])
    end

    def set_artist
      @artist = Artist.find(params[:artist_id])
    end

    def music_params
      params[:music].permit(:name, :link,:link_type)
    end
	
end
