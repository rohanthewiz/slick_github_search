require 'rails_helper'

RSpec.describe 'pages/home.html.erb', type: :view do
  before { visit root_path }
  it 'It should be pages#home' do
    expect(page).to have_link('login')
  end
end
