require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe 'shared/_keyword.html.erb' do
  before(:each) do
    @keyword = mock_model(Keyword, :phrase => "tragopan")
    assigns[:keyword] = @keyword
  end
  
  it 'should display the keyword phrase in a list item' do
    @keyword.should_receive :phrase
    render :partial => 'shared/keyword', :locals => {:keyword => @keyword}
    response.should have_tag('li', "tragopan")
  end
end
