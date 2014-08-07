class FoodiepicturesController < ApplicationController

	def index
		@foodiepictures = Foodiepicture.all		
	end

	def show
		@id = params[:id]
		@foodiepicture = Foodiepicture.find(@id)
	end

	def new
		@foodiepicture = Foodiepicture.new
	end

	def create
		@foodiepicture = Foodiepicture.new(foodiepicture_params)
		if @foodiepicture.save
			redirect_to foodiepictures_path
		end
	end

	def edit
	end

	def update
	end

	def destroy
	end
end
