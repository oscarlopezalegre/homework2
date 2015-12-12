class User < ActiveRecord::Base
	has_secure_password
	has_many :conversations, :foreign_key => :sender_id
	has_many :friends, :foreign_key => :friend1

end
