require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/slot_contents/edit.html.erb" do
  include SlotContentsHelper
  
  before(:each) do
    assigns[:slot_content] = @slot_content = stub_model(SlotContent,
      :new_record? => false
    )
  end

  it "renders the edit slot_content form" do
    render
    
    response.should have_tag("form[action=#{slot_content_path(@slot_content)}][method=post]") do
    end
  end
end


