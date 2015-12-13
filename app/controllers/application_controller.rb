class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	def     require_user_logged_in
	  #I could send a flash message or something to make it more clear... but meh
	  if not session[:userid]
	    redirect_to root_path
	  else
	  end
	end

	def get_logger
		if @logger
			return @logger
		else
			@logger = Logger.new(STDERR)
		end
	end

end
