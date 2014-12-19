class CommentsController < ApplicationController
  # http_basic_authenticate_with :name => "dhh", :password => "secret", :only => :destroy
  # before_action :authenticate_user!
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def index
    @comments = Comment.all
     @comment = @micropost.comments.build(params[:comment])
     @comment.user = current_user
     redirect_to micropost_path(@micropost)
  end  

  def create
    logger.debug "55555555555555"
    logger.debug params.inspect
    @micropost = Micropost.find(params[:micropost_id])
    @comment = Comment.create(comment_params)
    @comment.micropost_id = params[:micropost_id]
    if @comment.save
      redirect_to root_url
    end
  end  

  def destroy
    @micropost = Micropost.find(params[:post_id])
    @comment = @micropost.comments.find(params[:id])
    @comment.destroy
    redirect_to micropost_path(@micropost)
  end
  
   def commentlike
      @like = CommentLike.new()
      @like.comment_id = params[:comment_id]
      if @like.save
        redirect_to root_url
      end         
  end  
  
  def commentunlike
      @like = CommentLike.find_by(comment_id: params[:comment_id])
      if @like.delete
        redirect_to root_url
      end       
  end 

  private
    def comment_params
      params.require(:comment).permit(:content, :picture)
    end

end
