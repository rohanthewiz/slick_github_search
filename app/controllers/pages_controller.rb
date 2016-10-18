class PagesController < ApplicationController
  before_filter :ensure_logged_in, only: :search

  def home
  end

  def search
    if page_params[:search_term]
      octo_params = {}.tap do |octo|
        octo[:utf8] = page_params[:utf8] if page_params[:utf8].present?
        octo[:commit] = page_params[:commit] if page_params[:commit].present?
        octo[:page] = page_params[:page] if page_params[:page].present?

      end
      @results = get_client.search_repositories(page_params[:search_term], octo_params)
      binding.pry
      @search_term = params[:search_term]
    end
  end

  def page_params
    params.permit(:search_term, :page, :utf8, :commit)
  end

  private

  def get_client
    @client ||= Octokit::Client.new(access_token: current_user.token)
  end
end
