class UserPreferenceGroupsController < ApplicationController
	before_action :check_current_user_is_admin?
	def create
		@user_preference_group = UserPreferenceGroup.new(params_user_preferences)
		if @user_preference_group.save
			flash[:success] = "User preference group create"
			redirect_to user_preference_users_path
		else
			flash[:error] = "User preference group not create"
			redirect_to user_preference_users_path
		end
	end
	def edit
		@user_preferences_group = UserPreferenceGroup.find(params[:id])
	end
	def update
		 @user_preferences_group = UserPreferenceGroup.find(params[:id])
		if @user_preferences_group.update_attributes(params_user_preferences)
			flash[:success] = "User preference group Updated successfully"
			redirect_to user_preference_users_path
		else
			flash[:error] = "User preference group not Updated successfully"
			redirect_to user_preference_users_path
		end
	end
	private
		def params_user_preferences
			params.require(:user_preference_group).permit(:name,child_preferences_attributes:[:controller_name,:id,:_destroy])
		end
		def check_current_user_is_admin?
			if current_user.user_info.privilege_set != "Admin"
				flash[:info] = "Sorry you not allow to open this page !!"
				redirect_to :root
			end
		end
end
