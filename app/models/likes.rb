class Likes < ActiveRecord::Base
	validates_uniqueness_of :micropost_id, :scope => [:micropost_id]
	belongs_to :micropots, :polymorphic => true
	attr_accessor :micropost_id
end
