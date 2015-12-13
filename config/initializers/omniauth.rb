OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '926433560773872', '267c280eea09027395ca920611826003'
end