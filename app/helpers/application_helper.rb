module ApplicationHelper
	def get_rating(m)
    
if Rating.where(music_id: m.id, user_id: current_user.id).first
    return Rating.where(music_id: m.id, user_id: current_user.id).first 
   else
    return Rating.create(music_id: m.id, user_id: current_user.id, score: 0)
end
  end
end
