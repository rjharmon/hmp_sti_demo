require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SlotsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "slots", :action => "index").should == "/slots"
    end
  
    it "maps #new" do
      route_for(:controller => "slots", :action => "new").should == "/slots/new"
    end
  
    it "maps #show" do
      route_for(:controller => "slots", :action => "show", :id => "1").should == "/slots/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "slots", :action => "edit", :id => "1").should == "/slots/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "slots", :action => "create").should == {:path => "/slots", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "slots", :action => "update", :id => "1").should == {:path =>"/slots/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "slots", :action => "destroy", :id => "1").should == {:path =>"/slots/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/slots").should == {:controller => "slots", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/slots/new").should == {:controller => "slots", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/slots").should == {:controller => "slots", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/slots/1").should == {:controller => "slots", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/slots/1/edit").should == {:controller => "slots", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/slots/1").should == {:controller => "slots", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/slots/1").should == {:controller => "slots", :action => "destroy", :id => "1"}
    end
  end
end
