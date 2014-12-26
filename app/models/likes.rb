class Likes < ActiveRecord::Base
  # validates :user_does_not_already_like_micropost
  validates_uniqueness_of :micropost_id, :scope => [:micropost_id]
  belongs_to :micropots, :polymorphic => true
  attr_accessor :micropost_id

  # def user_does_not_already_like_micropost
  # 	errors.add(:user, "you can only like a micropost once") if user.already_likes?(micropost)
  # end	
end    

