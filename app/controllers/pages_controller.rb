class PagesController < ApplicationController
  before_filter :ensure_logged_in, only: :search

  def home
  end

  def search
    if page_params[:search_term]
      pattern = page_params[:search_term].dup
      if page_params[:language_filter].present?
        pattern << " language:#{page_params[:language_filter]}"
        @language_filter = page_params[:language_filter]
      end
      @octo_params = build_octo_params(page_params)
      puts @octo_params
      @results = get_client.search_repositories(pattern, @octo_params )
      @search_term = page_params[:search_term]
    end
  end

  private

  def get_client
    @client ||= Octokit::Client.new(access_token: current_user.token)
  end

  def build_octo_params(page_params)
    {}.tap do |octo|
      octo[:utf8] = page_params[:utf8] if page_params[:utf8].present?
      octo[:commit] = page_params[:commit] if page_params[:commit].present?
      octo[:page] = page_params[:page] if page_params[:page].present?
      octo[:per_page] = 22
      # Sort attributes are stored in the session
      if page_params[:sort_by].present?
        if session[:sort_by] == page_params[:sort_by] # just toggle if on the same column
          session[:sort_order] = session[:sort_order] == 'desc' ? 'asc' : 'desc'
        else # sort numerics 'desc', alphas 'asc'
          session[:sort_by] = page_params[:sort_by]
          session[:sort_order] = 'desc'
        end
      end
      octo[:sort] = session[:sort_by].present? ? session[:sort_by] : 'stars'
      octo[:order] = session[:sort_order].present? ? session[:sort_order] : 'desc'
    end
  end

  def page_params
    params.permit(:search_term, :language_filter, :page, :utf8, :commit, :sort_by)
  end
end
