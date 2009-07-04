require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/slot_contents/index.html.erb" do
  include SlotContentsHelper
  
  before(:each) do
    assigns[:slot_contents] = [
      stub_model(SlotContent),
      stub_model(SlotContent)
    ]
  end

  it "renders a list of slot_contents" do
    render
  end
end

