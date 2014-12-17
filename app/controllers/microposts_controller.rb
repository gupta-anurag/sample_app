class MicropostsController < ApplicationController
  # http_basic_authenticate_with :name => "dhh", :password => "secret", :only => :destroy
  # before_action :authenticate_user!
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def index
    @microposts = Micropost.all
     @comment = @micropost.comments.build(params[:comment])
     @comment.user = current_user
  end  
  
  def create
  	 @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      logger.debug Micropost.all
      flash[:success] = "Micropost created!"
      redirect_to root_url
  	else
      @feed_items = []
  	  render 'static_pages/home'
  	end  	  	
  end
  
  def destroy
    @micropost.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url
  end

  def comments_count
    comment.count
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content, :picture)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end
