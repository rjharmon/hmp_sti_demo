require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/slots/edit.html.erb" do
  include SlotsHelper
  
  before(:each) do
    assigns[:slot] = @slot = stub_model(Slot,
      :new_record? => false
    )
  end

  it "renders the edit slot form" do
    render
    
    response.should have_tag("form[action=#{slot_path(@slot)}][method=post]") do
    end
  end
end


