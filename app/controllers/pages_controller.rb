class PagesController < ApplicationController
  before_filter :ensure_logged_in, only: :search

  def home
  end

  def search

  end
end
