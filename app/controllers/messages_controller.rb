class MessagesController < ApplicationController

  def new
    require_user_logged_in
    @messages = Message.all
    friends = Friend.myfriends(session[:userid])
    @friend_list = []
    friends.each do |i|
      if i.friend1 == session[:userid]
        @friend_list.push(i.friend2)    
      else
        @friend_list.push(i.friend1)      
      end
    end
    @friend_list=@friend_list.uniq
  end

  def create
    require_user_logged_in
    @content = params[:message][:content]
    @sender = User.find(session[:userid])
    @recipient = User.find(params[:message][:recipient])
    @read = false
    @attachment = params[:message][:imagefile]    
    # like this

    message = Message.new(:content => @content, :sender => @sender, :recipient => @recipient, :read => @read)
    if @attachment
        message.attachment = @attachment

#      File.open(@attachment) do |f|
#        message.attachment = f
#      end
    end
    if message.save
      #success and beers

      MessageMailer.receive_email(@recipient,message).deliver_now

      redirect_to messages_path
    else
      #error try again later (maybe a flash message)
    end
  end

  def show
    require_user_logged_in
    @message = Message.find(params[:id])
    if @message.read
        redirect_to message_error_path
    else
      @message.read = true
      @message.read_time = Time.now
      @message.save
      MessageMailer.read_email(@message).deliver_now

    end
  end

  def index
    require_user_logged_in
  	@messages = Message.received_messages(session[:userid]).page(params[:page]).per(5)
  	@users = User.all
  end

  def sent 
    require_user_logged_in
    @sent_messages = Message.sent_messages(session[:userid])
  end

  def already_read

  end


end
