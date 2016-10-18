class User < ActiveRecord::Base
  def self.from_omniauth(auth_hash)
    find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider']) do |user|
      token = auth_hash[:credentials][:token]
      Rails.logger.info %(Github provided token is: #{token})
      user.name = auth_hash[:info][:name]
      user.location = auth_hash[:info][:location]
      user.image_url = auth_hash[:info][:image]
      user.url = auth_hash[:info][:urls]['Github']
      user.save!
    end
  end
end
