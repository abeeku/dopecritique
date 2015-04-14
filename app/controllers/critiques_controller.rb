class CritiquesController < ApplicationController
  before_action :set_critique, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:index, :show]
  respond_to :html

  def index
    @critiques = Critique.all
    @hotArtist = Artist.highest_voted.limit(1).first
    @top_songs = Music.highest_voted.limit(10)
     @activities = PublicActivity::Activity.order("created_at desc").where.not(owner_id: current_user.id) if current_user
      @activities = PublicActivity::Activity.order("created_at desc") if !current_user
    @soonMusic = Music.coming_soon.limit(10)
    @soonAblums = Album.coming_soon.limit(10)
    @soonMixes = Mixtape.coming_soon.limit(10)
respond_with(@critiques)
  end

  def show
    respond_with(@critique)
  end

def like
  @critiqueToLike = Critique.find(params[:id])
 @critiqueToLike.liked_by current_user

  redirect_to request.referrer
end
  def new
    @critique = current_user.critiques.build
    
    respond_with(@critique)
  end

  def edit
  end

  def create
    @critique = current_user.critiques.create(critique_params)
   #render params.inspect
   redirect_to root_path
  end

  def update
    @critique.update(critique_params)
    respond_with(@critique)
  end


  def destroy
    @critique.destroy
    respond_with(@critique)
  end

  private
    def set_critique
      @critique = Critique.find(params[:id])
    end

    def critique_params
      params.require(:critique).permit(:description, :user_id,:music_id)
    end
end
