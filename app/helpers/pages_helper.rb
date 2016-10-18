module PagesHelper

  def page_from_href(last_response_rel)
    last_response_rel.href.match(/[&\?]page=(\d+)/)[1].to_i
  end
end
