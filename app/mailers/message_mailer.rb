class MessageMailer < ApplicationMailer

  def receive_email(recipient, message)
    @recipient = recipient
    @message = message
    @host = get_host
    @port = get_port
    if(@recipient.email)
	    mail(to: @recipient.email , subject: 'You just received a message')
	end
  end

  def read_email(message)
  	@message = message
  	@sender = User.find(message.sender)
  	@host = get_host
    @port = get_port
    if(@sender.email)
	    mail(to: @sender.email , subject: 'Your message has been read')
	end

  end

end
