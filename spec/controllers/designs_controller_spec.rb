require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe DesignsController do

  def mock_design(stubs={})
    @mock_design ||= mock_model(Design, stubs)
  end
  
  describe "GET index" do
    it "assigns all designs as @designs" do
      Design.stub!(:find).with(:all).and_return([mock_design])
      get :index
      assigns[:designs].should == [mock_design]
    end
  end

  describe "GET show" do
    it "assigns the requested design as @design" do
      Design.stub!(:find).with("37").and_return(mock_design)
      get :show, :id => "37"
      assigns[:design].should equal(mock_design)
    end
  end

  describe "GET new" do
    it "assigns a new design as @design" do
      Design.stub!(:new).and_return(mock_design)
      get :new
      assigns[:design].should equal(mock_design)
    end
  end

  describe "GET edit" do
    it "assigns the requested design as @design" do
      Design.stub!(:find).with("37").and_return(mock_design)
      get :edit, :id => "37"
      assigns[:design].should equal(mock_design)
    end
  end

  describe "POST create" do
    
    describe "with valid params" do
      it "assigns a newly created design as @design" do
        Design.stub!(:new).with({'these' => 'params'}).and_return(mock_design(:save => true))
        post :create, :design => {:these => 'params'}
        assigns[:design].should equal(mock_design)
      end

      it "redirects to the created design" do
        Design.stub!(:new).and_return(mock_design(:save => true))
        post :create, :design => {}
        response.should redirect_to(design_url(mock_design))
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved design as @design" do
        Design.stub!(:new).with({'these' => 'params'}).and_return(mock_design(:save => false))
        post :create, :design => {:these => 'params'}
        assigns[:design].should equal(mock_design)
      end

      it "re-renders the 'new' template" do
        Design.stub!(:new).and_return(mock_design(:save => false))
        post :create, :design => {}
        response.should render_template('new')
      end
    end
    
  end

  describe "PUT update" do
    
    describe "with valid params" do
      it "updates the requested design" do
        Design.should_receive(:find).with("37").and_return(mock_design)
        mock_design.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :design => {:these => 'params'}
      end

      it "assigns the requested design as @design" do
        Design.stub!(:find).and_return(mock_design(:update_attributes => true))
        put :update, :id => "1"
        assigns[:design].should equal(mock_design)
      end

      it "redirects to the design" do
        Design.stub!(:find).and_return(mock_design(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(design_url(mock_design))
      end
    end
    
    describe "with invalid params" do
      it "updates the requested design" do
        Design.should_receive(:find).with("37").and_return(mock_design)
        mock_design.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :design => {:these => 'params'}
      end

      it "assigns the design as @design" do
        Design.stub!(:find).and_return(mock_design(:update_attributes => false))
        put :update, :id => "1"
        assigns[:design].should equal(mock_design)
      end

      it "re-renders the 'edit' template" do
        Design.stub!(:find).and_return(mock_design(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end
    
  end

  describe "DELETE destroy" do
    it "destroys the requested design" do
      Design.should_receive(:find).with("37").and_return(mock_design)
      mock_design.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the designs list" do
      Design.stub!(:find).and_return(mock_design(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(designs_url)
    end
  end

end
