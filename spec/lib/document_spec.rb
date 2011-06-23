require File.join(File.dirname(__FILE__), '../spec_helper')

describe SolrMapper::Document do
  
  describe "initializer" do
    
    it "should be able to initialize" do
      SolrMapper::Document.new
    end
    
    it "should accept attributes in the initializer" do
      SolrMapper::Document.new(
        :foo => 'bar'
      )
    end
    
  end
  
  describe "attributes" do
    before :all do
      @document = SolrMapper::Document.new(
        :foo => 'bar'
      )
    end
    
    it "should be accessible when sent in the initializer" do
      @document.foo.should == 'bar'
    end

  end
  
end