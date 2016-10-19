require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  describe 'Home action' do
    it 'returns http success' do
      get :home
      expect(response).to have_http_status(:success)
    end
  end

  describe 'Search action' do
    it 'redirects to home when not logged in' do
      get :search
      expect(response).to redirect_to(root_path)
    end
  end

end
