class FollowersController < ApplicationController
  def create

  	@artist = Artist.find(params[:artist_id]) 
    current_user.follow(@artist)


  end

  def destroy
  	@artist = Artist.find(params[:artist_id]) 
    current_user.stop_following(@artist)
  end
end
