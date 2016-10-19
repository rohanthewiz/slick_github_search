require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe 'GET #create' do
    before do
      str_token = 'a8b8f1fd66761674e6f5e21234567890'
      @auth_hash = {'provider'    => 'github',
                    'uid'         => '56789123',
                    'info'        =>
                        {'email' => nil,
                         'name'  => 'John Brown',
                         'image' => 'https://avatars.githubusercontent.com/u/1234',
                         'urls'  => {'GitHub' => 'https://github.com/rohanthewiz', 'Blog' => nil}},
                    'credentials' => {'token'   => str_token,
                                      'expires' => false},
                    'extra'       =>
                        {'raw_info' =>
                             {'location' => 'Texas'}}}.deep_symbolize_keys
    end

    it 'returns redirects to home if not OAuthng' do
      get :create
      expect(response).to redirect_to(pages_home_path)
    end

    it 'redirects to search action if OAuth successful' do
      request.env['omniauth.auth'] = @auth_hash
      get :create
      expect(response).to redirect_to(pages_search_path)
    end
  end
end
