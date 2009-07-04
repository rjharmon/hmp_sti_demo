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
    s.slot_items << Factory(:content_a, :type => "ContentA")
    s.slot_items << Factory(:content_b, :type => "ContentB")
    s.slot_items << Factory(:design_a, :type => "DesignTypeA")
    s.slot_items << Factory(:design_b, :type => "DesignTypeB")
    
    s.save

    s.slot_items('reload').size.should == 4

    s.slot_items[0].class.to_s.should == "ContentA"
    s.slot_items[1].class.to_s.should == "ContentB"
    s.slot_items[2].thingy.should == "typeA"
    s.slot_items[3].thingy.should == "typeB"
    4.times do |i|
      s.slot_items[i].slots.should == [s]
    end
  end
end
