class FriendsController < ApplicationController
  def index
    require_user_logged_in
#    @users = User.all_friends(session[:userid]).page(params[:page]).per(10)
    @users = User.all_but_me(session[:userid]).page(params[:page]).per(10)
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
    message = Message.find(params[:id])
    if session[:userid] != message.recipient
      redirect_to root_path
      #put some funny redirect here
    end
  end

  def block
    require_user_logged_in
    block_friend=params[:format]
    @friends=Friend.friends(session[:userid],block_friend)
    @friends.each do |i|
      i.block=true
      i.save
    end
    redirect_to friends_path
  end


  def unblock
    require_user_logged_in
    block_friend=params[:format]
    @friends=Friend.friends(session[:userid],block_friend)
    @friends.each do |i|
      i.block=false
      i.save
    end
    redirect_to friends_path
  end

  def destroy
    require_user_logged_in
    destroy_friend=params[:format]
    @friends=Friend.friends(session[:userid],destroy_friend)

    @friends.each do |i|
      i.destroy
      i.save
    end

    redirect_to friends_path

  end



end
