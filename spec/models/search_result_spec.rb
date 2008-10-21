require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SearchResult do
  before(:all) do
    @boss_result = mock('boss_result')
    @boss_result.stub!(:title).and_return( 'Chicken Runs Wild' )
    @boss_result.stub!(:clickurl).and_return('http://wildchicken.org')
    @boss_result.stub!(:dispurl).and_return('wildchicken.org')
    @boss_result.stub!(:abstract).and_return('Chickens are running wild and have infiltrated all levels of government.')
    @boss_result.stub!(:date).and_return(Date.today)
  end

  it "should create a new instance given a result" do
    res = SearchResult.new(@boss_result)
    res.title.should eql(@boss_result.title)
    res.abstract.should eql(@boss_result.abstract)
    res.click_url.should eql(@boss_result.clickurl)
    res.date.should eql(@boss_result.date)
  end
end
