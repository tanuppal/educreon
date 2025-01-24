class ActivityTypesController < ApplicationController
	before_action :set_activity_type, only: [:show, :edit, :update, :destroy]

	def create
	  @activity_type = ActivityType.new(activity_type_params)
	  respond_to do |format|
	    if @activity_type.save
	      format.html { redirect_to new_company_path, notice: 'activity type was successfully created.' }
	      format.js
	    else
	      format.html { render :new }
	      format.js
	    end
	  end
	end

	#get all customer terms
	def all_activity_type
		@all_activity_types = ActivityType.all
		render :json=> @all_activity_types
	end

	# def update
	#   respond_to do |format|
	#     if @activity_type.update(activity_type_params)
	#       format.html { redirect_to new_customer_path, notice: 'customer term was successfully updated.' }
	#       format.js
	#     else
	#       format.html { render :edit }
	#       format.js
	#     end
	#   end
	# end

	# def destroy
	#   @activity_type.destroy
	#   respond_to do |format|
	#     format.html { redirect_to new_customer_path, notice: 'customer term was successfully destroyed.' }
	#     format.js
	#   end
	# end

	private
	  def set_activity_type
	    @activity_type = ActivityType.find(params[:id])
	  end

	  def activity_type_params
	    params.require(:activity_type).permit(:name)
	  end
end
