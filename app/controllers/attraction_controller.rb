class AttractionController < ApplicationController
	skip_before_action :require_admin, only: [:show, :index]
	skip_before_action :require_login

	def index
		@attractions = Attraction.all
	end

	def new
		@attraction = Attraction.new
	end

	def create
	end

	def show
		@attraction = Attraction.find(params[:id])
	end


	def edit
	end
	
	def update
	end

	def destroy
	end


	private
		def attraction_params(*args)
			params.require(:attraction).permit(*args)
		end

end