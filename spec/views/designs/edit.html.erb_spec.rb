require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/designs/edit.html.erb" do
  include DesignsHelper
  
  before(:each) do
    assigns[:design] = @design = stub_model(Design,
      :new_record? => false
    )
  end

  it "renders the edit design form" do
    render
    
    response.should have_tag("form[action=#{design_path(@design)}][method=post]") do
    end
  end
end


