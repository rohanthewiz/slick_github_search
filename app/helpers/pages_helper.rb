module PagesHelper
  def page_from_href(last_response_rel)
    last_response_rel.href.match(/[&\?]page=(\d+)/)[1].to_i
  end

  def number_of_pages(last_response)
    total_pages = 1
    if last_response.rels[:last].present?
      total_pages = page_from_href(last_response.rels[:last])
    elsif last_response.rels[:prev].present?
      total_pages = page_from_href(last_response.rels[:prev]) + 1
    end
    total_pages
  end

  def get_current_page(last_response)
    current = 1
    if last_response.rels[:next].present?
      current = page_from_href(last_response.rels[:next]) - 1
    elsif last_response.rels[:prev].present?
      current = page_from_href(last_response.rels[:prev]) + 1
    end
    current
  end

  def active_sort?(title, sort_by, sort_order)
    return '' unless sort_by == title
    "sort-#{sort_order}"
  end
end
