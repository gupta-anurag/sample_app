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
    @micropost = Micropost.find(params[:micropost_id])
    @comment = Comment.create(comment_params)
    if @comment.save
      redirect_to micropost_path(@micropost)
    end
  end  

  def destroy
    @micropost = Micropost.find(params[:post_id])
    @comment = @micropost.comments.find(params[:id])
    @comment.destroy
    redirect_to micropost_path(@micropost)
  end


  private
    def comment_params
      params.require(:comment).permit(:content)
    end

end
