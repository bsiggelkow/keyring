require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe 'main/index.html.erb' do
  before(:each) do
    @keywords = [
      mock_model(Keyword, :phrase => 'chicken'),
      mock_model(Keyword, :phrase => 'goat')
    ]
    @results = []
    assigns[:keywords] = @keywords
    assigns[:results] = @results
  end
  
  it 'should display the keywords in a list' do
    render 'main/index'
    response.should have_tag('li', 'chicken')
    response.should have_tag('li', 'goat')
  end
end
