class Likes < ActiveRecord::Base
  belongs_to :likable, :polymorphic => true
  attr_accessible :likable_id, :likable_type, :user_id
end
