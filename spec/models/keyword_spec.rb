require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Keyword do
  before(:all) do
    @valid_attributes = {
      :phrase => 'septagenarian'
    }
    @invalid_attributes = {
      :phrase => nil
    }
  end

  it "should be valid when saved with valid attributes" do
    keyword = Keyword.new(@valid_attributes)
    keyword.save
    keyword.should be_valid
  end

  it "should not be valid when saved with invalid attributes" do
    keyword = Keyword.new(@invalid_attributes)
    keyword.save
    keyword.should_not be_valid
  end
  
  it 'should validate uniqueness of phrase' do
    Keyword.create!(@valid_attributes)
    keyword = Keyword.new(@valid_attributes)
    keyword.save
    keyword.errors.on(:phrase).should == 'has already been taken'
  end
  
end
