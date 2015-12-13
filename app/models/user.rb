class User < ActiveRecord::Base
	has_secure_password
	has_many :conversations, :foreign_key => :sender_id
	has_many :friends, :foreign_key => :friend1


  def self.from_omniauth(auth)


    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider 
      user.uid      = auth.uid
      user.name     = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.password = "test"
      user.save
    end

#    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
#      user.provider = auth.provider
#      user.uid = auth.uid
#      user.name = auth.info.name
#      user.oauth_token = auth.credentials.token
#      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
#      user.save!
#    end
  end
end
