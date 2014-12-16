class Comment < ActiveRecord::Base
  # attr_accessor :body, :commenter, :micropost	
  belongs_to :micropost
end
