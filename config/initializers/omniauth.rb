
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'E4ctWeMJ4E0NZg7dQk2a5UVcf', 'UKq9AHXNAEVibg6XpLH9mHIRFSv2dfGvEpJDEVVkiU6Rf0kyoi'
  #ENV['TWITTER_KEY'], ENV['TWITTER_SECRET'] # Todo: fix for production
end
