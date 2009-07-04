require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe DesignsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "designs", :action => "index").should == "/designs"
    end
  
    it "maps #new" do
      route_for(:controller => "designs", :action => "new").should == "/designs/new"
    end
  
    it "maps #show" do
      route_for(:controller => "designs", :action => "show", :id => "1").should == "/designs/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "designs", :action => "edit", :id => "1").should == "/designs/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "designs", :action => "create").should == {:path => "/designs", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "designs", :action => "update", :id => "1").should == {:path =>"/designs/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "designs", :action => "destroy", :id => "1").should == {:path =>"/designs/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/designs").should == {:controller => "designs", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/designs/new").should == {:controller => "designs", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/designs").should == {:controller => "designs", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/designs/1").should == {:controller => "designs", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/designs/1/edit").should == {:controller => "designs", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/designs/1").should == {:controller => "designs", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/designs/1").should == {:controller => "designs", :action => "destroy", :id => "1"}
    end
  end
end
