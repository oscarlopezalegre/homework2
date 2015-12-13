class SessionsController < ApplicationController

  def new
  end


  def create

  	@email = params[:session][:email]
  	@password = params[:session][:password]
	@success= false
	user = User.find_by_email(@email)

	@level = 0


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
end




