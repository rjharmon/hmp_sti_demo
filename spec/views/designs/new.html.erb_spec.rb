require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/designs/new.html.erb" do
  include DesignsHelper
  
  before(:each) do
    assigns[:design] = stub_model(Design,
      :new_record? => true
    )
  end

  it "renders new design form" do
    render
    
    response.should have_tag("form[action=?][method=post]", designs_path) do
    end
  end
end


