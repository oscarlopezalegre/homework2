class MessagesController < ApplicationController
  def create
  end

  def show
  end

  def index
  	@messages = Message.all
  	@users = User.all
  end

  def sent 
  end


end
