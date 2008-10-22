xml.instruct! :xml, :version => '1.0'
xml.rss :version => '2.0' do
  xml.title 'Articles'
  for result in @results
    xml.item do
      xml.title result.title
      xml.abstract result.abstract
      xml.display_url result.display_url
      xml.date result.date
    end
  end
end