require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/slot_contents/show.html.erb" do
  include SlotContentsHelper
  before(:each) do
    assigns[:slot_content] = @slot_content = stub_model(SlotContent)
  end

  it "renders attributes in <p>" do
    render
  end
end

