class FoodiepicturesController < ApplicationController

	def index
		@foodiepictures = Foodiepicture.all		
	end

	def show
		@foodiepicture = Foodiepicture.find(params[:id])
	end

	def new
		if !current_user
			redirect_to new_session_path
			return
		end
		@foodiepicture = Foodiepicture.new
	end

	def create
		if !current_user
			redirect_to new_session_path
			return
		end
		foodiepicture = current_user.foodiepictures.new(params.require(:foodiepicture).permit(:image, :description) )
		if foodiepicture.save
			redirect_to foodiepictures_path
		end
	end

	def edit
		@foodiepicture = Foodiepicture.find(params[:id])
		if (!current_user) || (@foodiepicture.user != current_user)
			redirect_to new_session_path
			return
		end
	end

	def update
		@foodiepicture = Foodiepicture.find(params[:id])
		if (!current_user) || (@foodiepicture.user)
			redirect_to new_session_path
			return
		elsif (@foodiepicture.user == current_user)
			if @foodiepicture.update_attributes(params.require(:foodiepicture).permit(:image, :description) )
				redirect_to foodiepictures_path
			else
				render 'edit'
			end
		else
			redirect_to new_session_path
		end
	end

	def destroy
		@foodiepicture = Foodiepicture.find(params[:id])
		@foodiepicture.destroy
		redirect_to foodiepictures_path
	end
end
