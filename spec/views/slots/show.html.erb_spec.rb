require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/slots/show.html.erb" do
  include SlotsHelper
  before(:each) do
    assigns[:slot] = @slot = stub_model(Slot)
  end

  it "renders attributes in <p>" do
    render
  end
end

