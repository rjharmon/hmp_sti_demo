require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SlotContent do
  before(:each) do
    @valid_attributes = {
    }
  end

  it "should create a new instance given valid attributes" do
    Factory(:slot_content)
  end
  it "should allow polymorphs" do
    s = Factory(:slot)
    t1 = Factory(:slot_content, :slot => s, :slot_item => Factory(:design))
    t2 = Factory(:slot_content, :slot => s, :slot_item => Factory(:content))
    s.slot_items('reload').size.should == 2
  end
  it "should allow two different polymorphic designs" do
    s = Factory(:slot)
    t1 = Factory(:slot_content, :slot => s, :slot_item => Factory(:design, :type => "DesignTypeA"))
    t2 = Factory(:slot_content, :slot => s, :slot_item => Factory(:design, :type => "DesignTypeB"))
    s.slot_items('reload').size.should == 2
    s.slot_items[0].thingy.should == "typeA"
    s.slot_items[1].thingy.should == "typeB"
  end
  it "should allow two different polymorphic contents" do
    s = Factory(:slot)
    t1 = Factory(:slot_content, :slot => s, :slot_item => Factory(:content, :type => "ContentA"))
    t2 = Factory(:slot_content, :slot => s, :slot_item => Factory(:content, :type => "ContentB"))
    s.slot_items('reload').size.should == 2
    s.slot_items[0].class.to_s.should == "ContentA"
    s.slot_items[1].class.to_s.should == "ContentB"
  end
  
  it "should allow two different polymorphic contents" do
    s = Factory(:slot)
    c1 = Factory(:slot_content, :slot => s, :slot_item => Factory(:content, :type => "ContentA"))
    c2 = Factory(:slot_content, :slot => s, :slot_item => Factory(:content, :type => "ContentB"))
    d1 = Factory(:slot_content, :slot => s, :slot_item => Factory(:design, :type => "DesignTypeA"))
    d2 = Factory(:slot_content, :slot => s, :slot_item => Factory(:design, :type => "DesignTypeB"))
    s.slot_items('reload').size.should == 4
    s.slot_items[0].class.to_s.should == "ContentA"
    s.slot_items[1].class.to_s.should == "ContentB"
    s.slot_items[2].thingy.should == "typeA"
    s.slot_items[3].thingy.should == "typeB"
  end
  
end
