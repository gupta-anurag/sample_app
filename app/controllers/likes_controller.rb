class LikesController < ApplicationController
	def create
    micropost = Micropost.find(params[:micropost])
     like = micropost.likes.build(:user_id => current_user.id)
     like.save
  end
end
