require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe MainController do

  it 'should successfully get index' do
    get :index
    response.should be_success
  end

  it 'should find all keywords' do
    Keyword.should_receive(:all).and_return([])
    get :index
  end

  it 'should render index.html.erb' do
    get :index
    response.should render_template(:index)
  end

end
