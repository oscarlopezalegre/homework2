class MessagesController < ApplicationController

  def new
    require_user_logged_in
    @messages = Message.all
    friends = Friend.myfriends(session[:userid])
    @friend_list = []
    friends.each do |i|
      if i.friend1_id != session[:userid]
        @friend_list.push(i.friend1)    
      else
        if i.friend2_id != session[:userid]
          @friend_list.push(i.friend2)    
        end
      end
    end
    @friend_list=@friend_list.uniq
    if @friend_list.count==0
      flash[:warning] = "You need to add friends to be able to send messages"
      redirect_to messages_path
    end

  end

  def create
    require_user_logged_in
    @content = params[:message][:content]
    @sender = User.find(session[:userid])
    @recipient = User.find(params[:message][:recipient])
    @read = false
    @attachment = params[:message][:imagefile]    
    @subject = params[:message][:subject]    
    # like this

    message = Message.new(:content => @content, :sender => @sender, :recipient => @recipient, :read => @read, :subject => @subject)
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
        flash[:warning] = "Error saving your message"
    end
  end

  def show
    require_user_logged_in
    @message = Message.find(params[:id])
    if @message.read
        flash[:warning] = "This message was already read"
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
