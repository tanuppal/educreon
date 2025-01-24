class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :check_user_permission , unless: :devise_controller?

  protected
  # def after_sign_in_path_for(resource)
  # 	if user_signed_in?
  # 		:root
  # 	end
  # end
  def check_user_permission
    current_uri = request.env['PATH_INFO']
    if current_user.present?
      privilege_set = current_user.user_info.privilege_set
      user_p_group = UserPreferenceGroup.where("name = ?",privilege_set).last
      if privilege_set == "Admin"
      else
        if user_p_group.present?
          check_user = user_p_group.child_preferences.where("controller_name = ?",controller_name).last
          if check_user.present?
          else
            if current_uri != "/"
              flash[:error] = "You are not allowed to open this page!!"
              redirect_to :root
            end
          end
        else
          # flash[:error] = "You are not allowed to open this page!!"
          if current_uri != "/"
           redirect_to :root
          end
        end  
      end   
    end
    
    puts "---------> #{current_uri} #{root_url} #{:root} #{Rails.root}"
  end

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :user
      new_user_session_path
    # else
    #   root_path
    end
  end  
  

	def configure_permitted_parameters
		added_attrs = [:email, :password, :password_confirmation, :remember_me, user_info_attributes: [:account_name,:display_name,:privilege_set]]
		devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
		devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
		devise_parameter_sanitizer.permit :account_update, keys: added_attrs
	end
end
