class SessionsController < ApplicationController
  def create
  	@email = params[:session][:email]
  	@password = params[:session][:password]
	@success= false
	user = User.find_by_email(@email)

	if user
		if user.authenticate(@password)
			#authorization completed
			@success= true
		else
			#authorization failed
		end
	else
		#email not found

	end
  end

  def destroy
  end
end
