class SlotContentsController < ApplicationController
  # GET /slot_contents
  # GET /slot_contents.xml
  def index
    @slot_contents = SlotContent.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @slot_contents }
    end
  end

  # GET /slot_contents/1
  # GET /slot_contents/1.xml
  def show
    @slot_content = SlotContent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @slot_content }
    end
  end

  # GET /slot_contents/new
  # GET /slot_contents/new.xml
  def new
    @slot_content = SlotContent.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @slot_content }
    end
  end

  # GET /slot_contents/1/edit
  def edit
    @slot_content = SlotContent.find(params[:id])
  end

  # POST /slot_contents
  # POST /slot_contents.xml
  def create
    @slot_content = SlotContent.new(params[:slot_content])

    respond_to do |format|
      if @slot_content.save
        flash[:notice] = 'SlotContent was successfully created.'
        format.html { redirect_to(@slot_content) }
        format.xml  { render :xml => @slot_content, :status => :created, :location => @slot_content }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @slot_content.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /slot_contents/1
  # PUT /slot_contents/1.xml
  def update
    @slot_content = SlotContent.find(params[:id])

    respond_to do |format|
      if @slot_content.update_attributes(params[:slot_content])
        flash[:notice] = 'SlotContent was successfully updated.'
        format.html { redirect_to(@slot_content) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @slot_content.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /slot_contents/1
  # DELETE /slot_contents/1.xml
  def destroy
    @slot_content = SlotContent.find(params[:id])
    @slot_content.destroy

    respond_to do |format|
      format.html { redirect_to(slot_contents_url) }
      format.xml  { head :ok }
    end
  end
end
