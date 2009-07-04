require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/designs/index.html.erb" do
  include DesignsHelper
  
  before(:each) do
    assigns[:designs] = [
      stub_model(Design),
      stub_model(Design)
    ]
  end

  it "renders a list of designs" do
    render
  end
end

