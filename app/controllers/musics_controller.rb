class MusicsController < ApplicationController
	 respond_to :html, :xml, :json
	def index
    @musics = Music.all
    respond_with(@musics)
  end

  def show
    respond_with(@music)
  end

  def new
    @music = Music.new
    respond_with(@music)
  end

  def edit
  end

  def create
    @artist = Artist.find(params[:artist_id])
    @music = Music.create(music_params)
    @music.artist_id = @artist.id
    @music.save
    respond_with(@music)
  end

  def update
    @music.update(music_params)
    respond_with(@music)
  end

  def destroy
    @music.destroy
    respond_with(@music)
  end

  private
    def set_music
      @music = Music.find(params[:id])
    end

    def music_params
      params.require(:music).permit(:user, :bio)
    end
	def like

	end
end
