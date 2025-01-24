class UsersController < ApplicationController
	before_action :set_users, only: [:show, :edit, :update, :destroy]
	def user_list
		@all_general_users = User.all.paginate(:page => params[:page], :per_page => 10).order("created_at DESC")
	end

	def user_preference
		@user_preferences_group = UserPreferenceGroup.new
		@user_preferences_group_list = UserPreferenceGroup.all
	end

	def create
		@users = User.new(params_user)
		if @users.save
			puts "==================>>>>>>"
			flash[:success] = "User Created"
			redirect_to user_list_users_path
		else
		puts "#{@user.errors.full_messages.to_sentence}"
			flash[:error] = "New User Not created"
			redirect_to user_list_users_path
		end
	end

	def new
		@users = User.new
		if params[:password].blank?
		   params.delete(:password)
		end
	end

	def show
		@user_preferences_groups = UserPreferenceGroup.all
	end

	def edit
	end	

	def create_user_by_admin
		@User = User.new(params_user)
		if @User.save
			flash[:success] = "User Created"
	  		redirect_to user_list_users_path
		else
			flash[:error] = "User Not Created #{@User.errors.full_messages}"
	  		redirect_to user_list_users_path
		end
	end
	def edit_user_by_admin
		@User = User.find(params[:id])
		if @User.update(params_user)
			flash[:success] = "User Updated"
	  		redirect_to user_list_users_path
		else
			flash[:error] = "User Not Updated #{@User.errors.full_messages}"
	  		redirect_to user_list_users_path
		end
	end

	def destroy 
	  	if @users.destroy
		  	flash[:success] = "User Deleted"
		  	redirect_to user_list_users_path
	  	else
		  	flash[:error] = "User Not Deleted"
		  	redirect_to user_list_users_path
	  	end
	end

	def update
  	if @users.update_attributes(params_user)
	    if @users.save
	    	flash[:success] = " User Updated"
				redirect_to user_path
			else
  			puts "Error"
  			puts "=========>>>>   #{@users.errors.full_messages.to_sentence}"
  	 		flash[:error] = "User Not updated"
  			redirect_to  edit_user_path
	    end
  	end
	end
	
	private
	def set_users
		@users = User.find(params[:id])
	end
	def params_user
		params.require(:user).permit(:email, :password, :password_confirmation, user_info_attributes:[:account_name, :display_name, :privilege_set, :id, :_destroy])
	end

end