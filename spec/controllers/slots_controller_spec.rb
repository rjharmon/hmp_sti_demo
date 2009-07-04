require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SlotsController do

  def mock_slot(stubs={})
    @mock_slot ||= mock_model(Slot, stubs)
  end
  
  describe "GET index" do
    it "assigns all slots as @slots" do
      Slot.stub!(:find).with(:all).and_return([mock_slot])
      get :index
      assigns[:slots].should == [mock_slot]
    end
  end

  describe "GET show" do
    it "assigns the requested slot as @slot" do
      Slot.stub!(:find).with("37").and_return(mock_slot)
      get :show, :id => "37"
      assigns[:slot].should equal(mock_slot)
    end
  end

  describe "GET new" do
    it "assigns a new slot as @slot" do
      Slot.stub!(:new).and_return(mock_slot)
      get :new
      assigns[:slot].should equal(mock_slot)
    end
  end

  describe "GET edit" do
    it "assigns the requested slot as @slot" do
      Slot.stub!(:find).with("37").and_return(mock_slot)
      get :edit, :id => "37"
      assigns[:slot].should equal(mock_slot)
    end
  end

  describe "POST create" do
    
    describe "with valid params" do
      it "assigns a newly created slot as @slot" do
        Slot.stub!(:new).with({'these' => 'params'}).and_return(mock_slot(:save => true))
        post :create, :slot => {:these => 'params'}
        assigns[:slot].should equal(mock_slot)
      end

      it "redirects to the created slot" do
        Slot.stub!(:new).and_return(mock_slot(:save => true))
        post :create, :slot => {}
        response.should redirect_to(slot_url(mock_slot))
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved slot as @slot" do
        Slot.stub!(:new).with({'these' => 'params'}).and_return(mock_slot(:save => false))
        post :create, :slot => {:these => 'params'}
        assigns[:slot].should equal(mock_slot)
      end

      it "re-renders the 'new' template" do
        Slot.stub!(:new).and_return(mock_slot(:save => false))
        post :create, :slot => {}
        response.should render_template('new')
      end
    end
    
  end

  describe "PUT update" do
    
    describe "with valid params" do
      it "updates the requested slot" do
        Slot.should_receive(:find).with("37").and_return(mock_slot)
        mock_slot.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :slot => {:these => 'params'}
      end

      it "assigns the requested slot as @slot" do
        Slot.stub!(:find).and_return(mock_slot(:update_attributes => true))
        put :update, :id => "1"
        assigns[:slot].should equal(mock_slot)
      end

      it "redirects to the slot" do
        Slot.stub!(:find).and_return(mock_slot(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(slot_url(mock_slot))
      end
    end
    
    describe "with invalid params" do
      it "updates the requested slot" do
        Slot.should_receive(:find).with("37").and_return(mock_slot)
        mock_slot.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :slot => {:these => 'params'}
      end

      it "assigns the slot as @slot" do
        Slot.stub!(:find).and_return(mock_slot(:update_attributes => false))
        put :update, :id => "1"
        assigns[:slot].should equal(mock_slot)
      end

      it "re-renders the 'edit' template" do
        Slot.stub!(:find).and_return(mock_slot(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end
    
  end

  describe "DELETE destroy" do
    it "destroys the requested slot" do
      Slot.should_receive(:find).with("37").and_return(mock_slot)
      mock_slot.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the slots list" do
      Slot.stub!(:find).and_return(mock_slot(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(slots_url)
    end
  end

end
