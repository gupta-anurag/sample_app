class LikesController < ApplicationController

  def create
  	@micropost = Micropost.find(params[:micropost])
  	@like = micropost.likes.build(:micropost_id, micropost_id)
  	@like.save
end
