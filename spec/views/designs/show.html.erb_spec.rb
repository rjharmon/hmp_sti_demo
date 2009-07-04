require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/designs/show.html.erb" do
  include DesignsHelper
  before(:each) do
    assigns[:design] = @design = stub_model(Design)
  end

  it "renders attributes in <p>" do
    render
  end
end

