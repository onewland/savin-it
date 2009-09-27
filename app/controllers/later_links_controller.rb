class LaterLinksController < ApplicationController
  # GET /later_links
  # GET /later_links.xml
  def index
    @later_links = LaterLink.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @later_links }
    end
  end

  # GET /later_links/1
  # GET /later_links/1.xml
  def show
    @later_link = LaterLink.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @later_link }
    end
  end

  # GET /later_links/new
  # GET /later_links/new.xml
  def new
    @later_link = LaterLink.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @later_link }
    end
  end

  # GET /later_links/1/edit
  def edit
    @later_link = LaterLink.find(params[:id])
  end

  # POST /later_links
  # POST /later_links.xml
  def create
    @later_link = LaterLink.new(params[:later_link])

    respond_to do |format|
      if @later_link.save
        flash[:notice] = 'LaterLink was successfully created.'
        format.html { redirect_to(@later_link) }
        format.xml  { render :xml => @later_link, :status => :created, :location => @later_link }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @later_link.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /later_links/1
  # PUT /later_links/1.xml
  def update
    @later_link = LaterLink.find(params[:id])

    respond_to do |format|
      if @later_link.update_attributes(params[:later_link])
        flash[:notice] = 'LaterLink was successfully updated.'
        format.html { redirect_to(@later_link) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @later_link.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /later_links/1
  # DELETE /later_links/1.xml
  def destroy
    @later_link = LaterLink.find(params[:id])
    @later_link.destroy

    respond_to do |format|
      format.html { redirect_to(later_links_url) }
      format.xml  { head :ok }
    end
  end

  def largest
    puts "largest called"
    @max_time = params[:max_time]
    @later_link = LaterLink.find_next_unfinished(@max_time)

    flash[:link] = @later_link
    flash[:max_time] = @max_time
    
    if @later_link
      @title = @later_link.name 
      respond_to do |format|
        format.html { render :action => "largest" }
      end
    else
      respond_to do |format|
        format.html { render :action => "done" }
      end
    end
  end

  def remove_largest_and_next_largest
    # This has to be assigned to a local, or there will be problems in the redirect
    # as flash[:max_time] will be cleared  
    if flash[:link]
      @later_link = flash[:link]
      @later_link.finished = true
      @later_link.save

      flash[:link] = nil
    end
    
    if !flash[:max_time]
      redirect_to :action => 'largest' 
    else
      redirect_to :action => 'largest', :max_time => flash[:max_time]
    end
  end
end
