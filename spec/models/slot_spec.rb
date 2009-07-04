require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Slot do
  before(:each) do
    @valid_attributes = {
    }
  end

  it "should create a new instance given valid attributes" do
    Factory(:slot)
  end
  
  it "should allow lots of polymorphic slot items" do
    s = Factory(:slot)
    s.slot_items << Factory(:content, :type => "ContentA")
    s.slot_items << Factory(:content, :type => "ContentB")
    s.slot_items << Factory(:design, :type => "DesignTypeA")
    s.slot_items << Factory(:design, :type => "DesignTypeB")

    s.save

    s.slot_items('reload').size.should == 4

    s.slot_items[0].class.to_s.should == "ContentA"
    s.slot_items[1].class.to_s.should == "ContentB"
    s.slot_items[2].thingy.should == "typeA"
    s.slot_items[3].thingy.should == "typeB"    
  end
end
