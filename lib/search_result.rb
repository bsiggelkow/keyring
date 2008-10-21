class SearchResult
  attr_reader :title, :abstract, :click_url, :display_url, :date
  def initialize(result)
    @title = result.title
    @abstract = result.abstract
    @click_url = result.clickurl
    @display_url = result.dispurl
    @date = result.date
  end
  
  def eql?(other)
    SearchResult === other && other.display_url == display_url
  end

  def hash
    display_url.hash
  end
end