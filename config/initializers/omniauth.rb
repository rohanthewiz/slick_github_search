
module SlickSearch
  # Best to use Environment vars
  # def self.config
  #   @config ||= YAML.load_file("#{Rails.root}/config/oauth.yml")[Rails.env].symbolize_keys!
  # end
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['OAUTH_CLIENT_ID'], ENV['OAUTH_CLIENT_SECRET']
end
