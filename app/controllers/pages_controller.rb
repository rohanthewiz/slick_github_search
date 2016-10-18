class PagesController < ApplicationController
  before_filter :ensure_logged_in, only: :search

  def home
  end

  def search
    if page_params[:search_term]
      pattern = page_params[:search_term].dup
      if page_params[:language_filter].present?
        @language_filter = page_params[:language_filter]
        pattern << " language:#{page_params[:language_filter]}"
      end
      octo_params = {}.tap do |octo|
        octo[:utf8] = page_params[:utf8] if page_params[:utf8].present?
        octo[:commit] = page_params[:commit] if page_params[:commit].present?
        octo[:page] = page_params[:page] if page_params[:page].present?
        octo[:per_page] = 25
        octo[:sort] = 'stars'
        octo[:order] = 'desc'
      end
      @results = get_client.search_repositories(pattern, octo_params)
      @search_term = page_params[:search_term]
      puts @search_term
      # &sort=stars&order=desc
    end
  end

  def page_params
    params.permit(:search_term, :language_filter, :page, :utf8, :commit)
  end

  private

  def get_client
    @client ||= Octokit::Client.new(access_token: current_user.token)
  end
end
