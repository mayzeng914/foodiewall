class UsersController < ApplicationController
  before_action :login
  # def index
  # 	@user = User.where(is_active: true)
  # end



  def create
  	@user = User.new(params.require(:user).permit(:name, :password, :password_confirmation))
    @foodiepictures = Foodiepicture.all
    if @user.save
          session[:user_id] = @user.id.to_s
      		redirect_to foodiepictures_path
    else
      render 'foodiepictures/index'
    end
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

  def login
    @user_login = User.new
    @is_login = true
  end

end
