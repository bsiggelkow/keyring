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

  it 'should assign keywords' do
    Keyword.should_receive(:all).and_return([])
    get :index
    assigns[:keywords].should == []
  end

  it 'should render index.html.erb' do
    get :index
    response.should render_template(:index)
  end

  it 'should update search results' do
    get :search
    assigns[:keywords].should_not be_nil
    response.should render_template(:search)
  end

end
