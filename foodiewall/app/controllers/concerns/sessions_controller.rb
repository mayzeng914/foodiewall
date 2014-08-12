class SessionsController < ApplicationController

  def new
  	@user = User.new
  	@is_login = true
  end

  def create
  	u = User.where(name: params[:user][:name]).first
  	if u && u.authenticate(params[:user][:password])
  		if u.is_active == false
  			redirect_to reactivate_user_path(u.id)
  		else
  			session[:user_id] = u.id.to_s
        session[:name] = u.name.to_s
  			redirect_to foodiepictures_path
  		end
  	else
  		redirect_to new_session_path
  	end
  end

  def destroy
  	reset_session
  	redirect_to foodiepictures_path
  end
end
