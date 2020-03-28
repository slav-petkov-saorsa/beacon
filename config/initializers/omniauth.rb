Rails.application.config.middleware.use OmniAuth::Builder do
  provider :onetime
end