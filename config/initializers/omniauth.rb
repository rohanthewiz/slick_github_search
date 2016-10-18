
module SlickSearch
  def self.config
    @config ||= YAML.load_file("#{Rails.root}/config/oauth.yml")[Rails.env].symbolize_keys!
  end
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, SlickSearch.config[:github_client_id],
                    SlickSearch.config[:github_client_secret]
end
