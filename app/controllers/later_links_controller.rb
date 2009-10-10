class LaterLinksController < ApplicationController
  before_filter :login_required

  @est_dur = 5
  # GET /later_links
  # GET /later_links.xml
  def index
    @later_links = current_user.later_links

    respond_to do |format|
      format.html # index.html.haml
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
      format.html # new.html.haml
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
    @later_link.user = current_user
    @later_link.finished = false

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
    @max_time = params[:max_time]
    @later_link = current_user.find_largest_next_unfinished_link_task(@max_time)

    flash[:link] = @later_link
    flash[:max_time] = @max_time
    
    if @later_link
      @title = @later_link.name
      @est_dur = @later_link.estimated_duration
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
