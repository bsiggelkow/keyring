require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe KeywordsController do

  it 'should create a new Keyword' do
    keyword = mock_model(Keyword)
    Keyword.should_receive(:create).and_return(keyword)
    xhr :post, :create, :keyword => {:phrase => 'yodeling'}
  end

  it 'should not complain when a duplicate phrase is entered' do
    Keyword.create!(:phrase => 'sherpa')
    xhr :post, :create, :keyword => {:phrase => 'sherpa'}
  end


  it 'should clear all keywords' do
    Keyword.should_receive(:destroy_all)
    xhr :delete, :clear_all
  end

end
