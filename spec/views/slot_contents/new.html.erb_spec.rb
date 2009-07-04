require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/slot_contents/new.html.erb" do
  include SlotContentsHelper
  
  before(:each) do
    assigns[:slot_content] = stub_model(SlotContent,
      :new_record? => true
    )
  end

  it "renders new slot_content form" do
    render
    
    response.should have_tag("form[action=?][method=post]", slot_contents_path) do
    end
  end
end


