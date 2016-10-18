require 'rails_helper'

RSpec.describe "pages/home.html.erb", type: :view do
  before { visit '/' }
  it 'It should be pages#home' do
    page.should have_link('login')
  end
end
