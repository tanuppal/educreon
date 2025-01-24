class RentalSettingsController < ApplicationController

	def add_rental_settings
		@rental_setting = RentalSetting.new
		@all_rental_setting = RentalSetting.all.paginate(:page => params[:page], :per_page => 10)
	end

	def create
		@rental_setting = RentalSetting.new(params_of_rental_setting)
		if @rental_setting.save
			puts "data saved"
			flash[:success] = "Rental Setting Created"
			redirect_to add_rental_settings_rental_settings_path
		else          
			puts "error"
			puts "#{@rental_setting.errors.full_messages.to_sentence}"
			flash[:error] = "Rental Setting not Created!!"
			redirect_to add_rental_settings_rental_settings_path
		end
	end

	def edit
		@all_rental_setting = RentalSetting.rental_setting_id(params[:id]).paginate(:page => params[:page], :per_page => 10)
		@rental_setting = RentalSetting.find(params[:id])
	end

	def update
		@rental_setting = RentalSetting.find(params[:id])
		if @rental_setting.update_attributes(params_of_rental_setting)
			flash[:success] = "Rental Setting updated"
			redirect_to add_rental_settings_rental_settings_path
		else
			puts "#{@rental_setting.errors.messages}"
			flash[:error] = "Somthing went wrong!!"
			render add_rental_settings_rental_settings_path
		end
	end
	def destroy 
		rental_setting = RentalSetting.find(params[:id])
		if rental_setting.destroy
			flash[:success] = "Rental Setting Deleted"
			redirect_to add_rental_settings_rental_settings_path
		else
			flash[:error] = "Rental Setting not Deleted"
			redirect_to add_rental_settings_rental_settings_path
		end
	end
	
	private
	def params_of_rental_setting
		params.require(:rental_setting).permit(:name, :address, :logo)
	end
end
