require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SlotContentsController do

  def mock_slot_content(stubs={})
    @mock_slot_content ||= mock_model(SlotContent, stubs)
  end
  
  describe "GET index" do
    it "assigns all slot_contents as @slot_contents" do
      SlotContent.stub!(:find).with(:all).and_return([mock_slot_content])
      get :index
      assigns[:slot_contents].should == [mock_slot_content]
    end
  end

  describe "GET show" do
    it "assigns the requested slot_content as @slot_content" do
      SlotContent.stub!(:find).with("37").and_return(mock_slot_content)
      get :show, :id => "37"
      assigns[:slot_content].should equal(mock_slot_content)
    end
  end

  describe "GET new" do
    it "assigns a new slot_content as @slot_content" do
      SlotContent.stub!(:new).and_return(mock_slot_content)
      get :new
      assigns[:slot_content].should equal(mock_slot_content)
    end
  end

  describe "GET edit" do
    it "assigns the requested slot_content as @slot_content" do
      SlotContent.stub!(:find).with("37").and_return(mock_slot_content)
      get :edit, :id => "37"
      assigns[:slot_content].should equal(mock_slot_content)
    end
  end

  describe "POST create" do
    
    describe "with valid params" do
      it "assigns a newly created slot_content as @slot_content" do
        SlotContent.stub!(:new).with({'these' => 'params'}).and_return(mock_slot_content(:save => true))
        post :create, :slot_content => {:these => 'params'}
        assigns[:slot_content].should equal(mock_slot_content)
      end

      it "redirects to the created slot_content" do
        SlotContent.stub!(:new).and_return(mock_slot_content(:save => true))
        post :create, :slot_content => {}
        response.should redirect_to(slot_content_url(mock_slot_content))
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved slot_content as @slot_content" do
        SlotContent.stub!(:new).with({'these' => 'params'}).and_return(mock_slot_content(:save => false))
        post :create, :slot_content => {:these => 'params'}
        assigns[:slot_content].should equal(mock_slot_content)
      end

      it "re-renders the 'new' template" do
        SlotContent.stub!(:new).and_return(mock_slot_content(:save => false))
        post :create, :slot_content => {}
        response.should render_template('new')
      end
    end
    
  end

  describe "PUT update" do
    
    describe "with valid params" do
      it "updates the requested slot_content" do
        SlotContent.should_receive(:find).with("37").and_return(mock_slot_content)
        mock_slot_content.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :slot_content => {:these => 'params'}
      end

      it "assigns the requested slot_content as @slot_content" do
        SlotContent.stub!(:find).and_return(mock_slot_content(:update_attributes => true))
        put :update, :id => "1"
        assigns[:slot_content].should equal(mock_slot_content)
      end

      it "redirects to the slot_content" do
        SlotContent.stub!(:find).and_return(mock_slot_content(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(slot_content_url(mock_slot_content))
      end
    end
    
    describe "with invalid params" do
      it "updates the requested slot_content" do
        SlotContent.should_receive(:find).with("37").and_return(mock_slot_content)
        mock_slot_content.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :slot_content => {:these => 'params'}
      end

      it "assigns the slot_content as @slot_content" do
        SlotContent.stub!(:find).and_return(mock_slot_content(:update_attributes => false))
        put :update, :id => "1"
        assigns[:slot_content].should equal(mock_slot_content)
      end

      it "re-renders the 'edit' template" do
        SlotContent.stub!(:find).and_return(mock_slot_content(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end
    
  end

  describe "DELETE destroy" do
    it "destroys the requested slot_content" do
      SlotContent.should_receive(:find).with("37").and_return(mock_slot_content)
      mock_slot_content.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the slot_contents list" do
      SlotContent.stub!(:find).and_return(mock_slot_content(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(slot_contents_url)
    end
  end

end
