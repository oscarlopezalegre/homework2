class FriendsController < ApplicationController
  def index
    require_user_logged_in
  	@users = User.all
  end

  def new
    require_user_logged_in
    @users = User.all

  	@friend = Friend.new

  	@friend.friend1 = @users.find(params[:format])
  	@friend.friend2 = @users.find(session[:userid])

  	if @friend.save
  		redirect_to friends_path
  	else
		redirect_to back_path  	
  	end
  
  end

  def create
    require_user_logged_in
  	@friend = Friend.new(:friend1 => params[:format], :friend2 => session[:userid])
  	if friend.save
  		redirect_to friend_path(friend)
  	else
		redirect_to back_path  	
  	end

  end

  def show
    require_user_logged_in
  end



end
