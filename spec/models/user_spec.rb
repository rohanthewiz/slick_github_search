require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @auth_hash = {"provider"=>"github",
 "uid"=>"123456",
 "info"=>
  {"email"=>nil,
   "name"=>"John Brown",
   "image"=>"https://avatars.githubusercontent.com/u/1234",
   "urls"=>{"GitHub"=>"https://github.com/rohanthewiz", "Blog"=>nil}},
 "credentials"=>{"token"=>"a8b8f1fd66761674e6f5e21234567890", "expires"=>false},
 "extra"=>
  {"raw_info"=>
    {"location"=>"Texas"}}}.deep_symbolize_keys
  end

  it 'Can create a user from omniauth hash' do
    user = User.from_omniauth(@auth_hash)
    expect(user).to be_persisted
  end
end
