class FriendsController < ApplicationController
  def index
  	@users = User.all
  end

  def new
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
  	@friend = Friend.new(:friend1 => params[:format], :friend2 => session[:userid])
  	if friend.save
  		redirect_to friend_path(friend)
  	else
		redirect_to back_path  	
  	end

  end

  def show
  end
end
