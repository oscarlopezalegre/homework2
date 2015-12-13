class WelcomeController < ApplicationController
  def index
  	if session[:userid]
  		redirect_to messages_path
  	end
  end
end
