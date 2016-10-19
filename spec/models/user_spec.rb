require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @str_token = 'a8b8f1fd66761674e6f5e21234567890'
    @auth_hash = {'provider'    => 'github',
                  'uid'         => '123456',
                  'info'        =>
                      {'email' => nil,
                       'name'  => 'John Brown',
                       'image' => 'https://avatars.githubusercontent.com/u/1234',
                       'urls'  => {'GitHub' => 'https://github.com/rohanthewiz', 'Blog' => nil}},
                  'credentials' => {'token'   => @str_token,
                                    'expires' => false},
                  'extra'       =>
                      {'raw_info' =>
                           {'location' => 'Texas'}}}.deep_symbolize_keys
  end

  it 'Can create a user from omniauth hash' do
    user = User.from_omniauth(@auth_hash)
    expect(user).to be_persisted
    expect(user.token).to eql(@str_token)
  end

  it 'Will not create user without provider and uid' do
    @auth_hash.delete :provider
    @auth_hash.delete :uid
    expect { User.from_omniauth(@auth_hash) }.to raise_error(ActiveRecord::RecordInvalid)
  end
end
