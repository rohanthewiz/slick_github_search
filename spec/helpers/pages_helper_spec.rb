require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the PagesHelper. For example:

# First page
# last_response.rels[:next]
# "https://api.github.com/search/repositories?order=asc&per_page=22&q=kafka&sort=forks&utf8=%E2%9C%93&page=2"
# last_response.rels[:last]
# "https://api.github.com/search/repositories?order=asc&per_page=22&q=kafka&sort=forks&utf8=%E2%9C%93&page=46"

# Page 3
# Rels: next, last, first, prev

# Last Page
# Rels: first, "https://api.github.com/search/repositories?order=asc&page=1&per_page=22&q=kafka&sort=forks&utf8=%E2%9C%93"
# prev  https://api.github.com/search/repositories?order=asc&page=45&per_page=22&q=kafka&sort=forks&utf8=%E2%9C%93


RSpec.describe PagesHelper, type: :helper do
  before do
    rels_struct = Struct.new(:rels)
    @last_response_no_rels = rels_struct.new({})
  end
  it 'should give a current page of one if no prev or next rels' do
    expect(get_current_page(@last_response_no_rels)).to eql(1)
  end
end
