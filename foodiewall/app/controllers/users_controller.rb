class UsersController < ApplicationController
  
  # def index
  # 	@user = User.where(is_active: true)
  # end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params.require(:user).permit(:name, :password, :password_confirmation))
    # name_all.nature = true
    # name_all = User.name.all
    # name_all.each do |n|
    #   if @user.name == n
    #     name_all.nature = false
    #   else
      	if @user.save
      		redirect_to foodiepictures_path
      	end
    #   end
    # end
  end

  def show
  	@user = User.find(params[:id])
    @foodiepictures = @user.foodiepictures
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params:id)
  	if current_user != @user
  		if current_user
  			redirect_to user_path(current_user)
  		else
  			redirect_to new_path
  		end
  	elsif 
  		@user.update_attributes(params.require(:user).permit(:name, :password, :is_active))
  		redirect_to user_show_path
  	else
  		render :edit
  	end
  end

  def destroy
  	User.find(params[:id])
  	@user.is_active = false
  	@user.save
  	redirect_to users_path
  end

end
