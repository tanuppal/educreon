class CitiesController < ApplicationController
before_action :set_cities, only: [:show, :edit, :update, :destroy]

	def create
	  @city = City.new(cities_params)
	  @request_form = params[:request_form]
	  respond_to do |format|
	    if @city.save
	      format.html { redirect_to new_customer_path }
	      format.js
	    else
	      format.html { render :new }
	      format.js
	    end
	  end
	end

	def get_all_city_by_state
       @all_city = City.where("state_id=?",params[:id])
       render json: @all_city
	end

	private
	  def set_cities
	    @all_cities = City.find(params[:id])
	  end

	  def cities_params
	    params.require(:city).permit(:state_id, :name)
	  end
end
