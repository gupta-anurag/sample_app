class UsersController < ApplicationController
   
  def index
    @user = User.all
  end 
   
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit

  end
    
  def create
    @user = User.new(params[:user])    # Not the final implementation!
    if @user.save
      # Handle a successful save.
    else
      render 'new'
    end
  end
  
  def update

  end

  def destroy

  end

  private

   def user_params
     params.require(:user).permit(:name, :email, :password, :password_confirmation)
   end
  end  