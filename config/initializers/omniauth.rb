OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1483838771867766', '6d34b7addf6c9a2d68a9c50d9ff9e71c',:scope => 'email,public_profile,user_friends,user_about_me', :info_fields => 'email,mail,user_about_me,emails'


end



