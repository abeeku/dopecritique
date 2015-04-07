class PagesController < ApplicationController
  def home
  	  @critiques = Critique.all
    @hotArtist = Artist.highest_voted.limit(1).first
    @top_songs = Music.highest_voted.limit(10)
     @activities = PublicActivity::Activity.order("created_at desc")
    @soonMusic = Music.coming_soon.limit(10)
    @soonAblums = Album.coming_soon.limit(10)
    @soonMixes = Mixtape.coming_soon.limit(10)

  end
end
