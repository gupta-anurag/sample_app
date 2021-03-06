class PasswordResetsController < ApplicationController
	before_action :get_user,         only: [:edit, :update]
	before_action :valid_user,       only: [:edit, :update]
	before_action :check_expiration, only: [:edit, :update]
	skip_before_filter :require_login

	def new
	end

	def create
		@user = User.find_by(email: params[:password_reset][:email].downcase)
		if @user
			@user.create_reset_digest
			UserMailer.password_reset_email(@user)
			flash[:info] = "Email sent with password reset instructions"
			redirect_to root_url
		else
			flash.now[:danger] = "Email address not found"
			render 'new'
		end
	end

	def edit
		@token = params[:id]
		@user = User.load_from_reset_password_token(params[:id])

		if @user.blank?
			not_authenticated
			return
		end  
		 @user.password_confirmation = params[:user][:password_confirmation]
    # the next line clears the temporary token and updates the password
    if @user.change_password!(params[:user][:password])
      redirect_to(root_path, :notice => 'Password was successfully updated.')
    else
      render :action => "edit"
    end
	end

	def update
		if both_passwords_blank?
			flash.now[:danger] = "Password/confirmation can't be blank"
			render 'edit'
		elsif @user.update_attributes(user_params)
			log_in @user
			flash[:success] = "Password has been reset."
			redirect_to @user
		else
			render 'edit'
		end
	end

 private
	 
		def user_params
			params.require(:user).permit(:password, :password_confirmation)
		end

		# Returns true if password & confirmation are blank.
		def both_passwords_blank?
			params[:user][:password].blank? && params[:user][:password_confirmation].blank?
		end

		# Before filters

		def get_user
			@user = User.find_by(email: params[:email])
		end

		# Confirms a valid user.
		def valid_user
			unless (@user && @user.activated? && @user.authenticated?(:reset, params[:id]))
				redirect_to root_url
			end
		end

		# Checks expiration of reset token.
		def check_expiration
			if @user.password_reset_expired?
				flash[:danger] = "Password reset has expired."
				redirect_to new_password_reset_url
			end
		end
end