class SessionsController < ApplicationController
  def create
  	@email = params[:session][:email]
  	@password = params[:session][:password]
	@success= false
	user = User.find_by_email(@email)

	if user
		if user.authenticate(@password)
			#authorization completed
			session[:userid] = user.id
			@success= true
		else
			#authorization failed
		end
	else
		#email not found

	end
  end

  def destroy
  	session.delete(:userid)
  end
end
