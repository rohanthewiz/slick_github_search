class User < ActiveRecord::Base

  def self.from_omniauth(auth_hash)
    user = find_or_create_by(uid: auth_hash[:uid], provider: auth_hash[:provider]) do |u|
      u.name = auth_hash[:info][:name]
      u.image_url = auth_hash[:info][:image]
      u.url = auth_hash[:info][:urls][:Github]
    end
    # We always want to update the attributes below
    user.token = auth_hash[:credentials][:token]
    user.location = auth_hash[:extra][:raw_info][:location]
    user.save!
    user
  end
end
