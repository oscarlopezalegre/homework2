class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  layout 'mailer'

  def get_host
  	host = 'localhost'
  	if Rails.env.production?
	 	   host = 'quiet-citadel-4060'
    end
    return host
  end
  
  def get_port
	  port = 3000
	  if Rails.env.production?
  		port = 80
    end
    return port
  end

end
