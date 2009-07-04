require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/slots/index.html.erb" do
  include SlotsHelper
  
  before(:each) do
    assigns[:slots] = [
      stub_model(Slot),
      stub_model(Slot)
    ]
  end

  it "renders a list of slots" do
    render
  end
end

