class SessionsController < ApplicationController

  def new
  end


  def create

    get_logger.error "..................................................................................1"

  	@email = params[:session][:email]
  	@password = params[:session][:password]
	  @success= false
	  user = User.find_by_email(@email)


  	if user

  		if user.authenticate(@password)
  			#authorization completed
  			session[:userid] = user.id
  			redirect_to messages_path
  		else
  			#authorization failed
  		end
  	else
  		#email not found

  	end
  end

  def destroy
  	session.delete(:userid)
  	redirect_to root_path
  end

  #needed for the log in with facebook
  def fb_create    

    user = User.from_omniauth(env["omniauth.auth"])
    session[:userid] = user.id
    redirect_to messages_path
  end

  def fb_destroy
    session[:userid] = nil
    redirect_to root_path
  end


end




