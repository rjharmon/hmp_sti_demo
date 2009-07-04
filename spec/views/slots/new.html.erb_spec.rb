require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/slots/new.html.erb" do
  include SlotsHelper
  
  before(:each) do
    assigns[:slot] = stub_model(Slot,
      :new_record? => true
    )
  end

  it "renders new slot form" do
    render
    
    response.should have_tag("form[action=?][method=post]", slots_path) do
    end
  end
end


