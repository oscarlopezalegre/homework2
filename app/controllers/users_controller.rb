class UsersController < ApplicationController

  def index
    @users = User.all.page(params[:page]).per(5)
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		#if I could redirect to create a new controller with post I would be so happy
  		#redirect_to url_for(:controller => 'sessions', :action => 'create', :params => user_params, :method => 'post')
  		session[:userid] = @user.id
	  	#redirect to messages
  		redirect_to messages_path
  	else
  		redirect_to root_path	
  	end
  end

  def show
  	@user = User.find(params[:id])
  end

  private
  	def user_params
  		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end	


end
