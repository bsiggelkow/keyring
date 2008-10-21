require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require 'ostruct'
describe BossmanClient do
  before(:all) do
    @result = OpenStruct.new( 
      :title    => 'Foo', 
      :abstract => 'Foo goes bar', 
      :clickurl => 'http://www.foobar.com', 
      :dispurl  => 'www.foobar.com',
      :date     => Date.today      
    )
    
    @client = BossmanClient.new
  end

  it "should create a new instance" do
    @client.should be_an_instance_of(BossmanClient)     
  end

  it "should perform a search and return results" do    
    # Mock out the BOSSMan result set
    result_set = mock(BOSSMan::ResultSet)
    result_set.should_receive(:totalhits).and_return( '1' )
    result_set.should_receive(:results).and_return( [@result] )

    BOSSMan::Search.should_receive(:web).with("\"foo\"", {:count => 10}).and_return(result_set)

    res = @client.search('foo')
    res.should have(1).item
  end
end
