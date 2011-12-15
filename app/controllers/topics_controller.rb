class TopicsController < ApplicationController
  # GET /topics
  # GET /topics.xml
  def index
    #@topics = Topic.all
    #@topics = Topic.where({:forum_id => params[:forum_id]})
    @forum = Forum.find(params[:forum_id])
    @topics = @forum.topics

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @topics }
    end
  end

  # GET /topics/1
  # GET /topics/1.xml
  def show
    @forum = Forum.find(params[:forum_id])
    @topic = @forum.topics.find(params[:id])
    #@topic = Topic.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @topic }
    end
  end

  # GET /topics/new
  # GET /topics/new.xml
  def new
    @topic = Topic.new
    @forum = Forum.find(params[:forum_id])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @topic }
    end
  end

  # GET /topics/1/edit
  def edit
    #@topic = Topic.find(params[:id])
    @forum = Forum.find(params[:forum_id])
    @topic = @forum.topics.find(params[:id])
  end

  # POST /topics
  # POST /topics.xml
  def create
    @forum = Forum.find(params[:forum_id])
    @topic = Topic.new(params[:topic])
    @topic.forum_id = params[:forum_id]
    saved = @topic.save

    respond_to do |format|
      if saved
        format.html { redirect_to(forum_topic_path(@forum), :notice => 'Topic was successfully created.') }
        format.xml  { render :xml => @topic, :status => :created, :location => @topic }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @topic.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /topics/1
  # PUT /topics/1.xml
  def update
    @forum = Forum.find(params[:forum_id])
    @topic = @forum.topics.find(params[:id])
    #@topic = Topic.find(params[:id])

    respond_to do |format|
      if @topic.update_attributes(params[:topic])
        #format.html { redirect_to(@topic, :notice => 'Topic was successfully updated.') }
        format.html { redirect_to(forum_topic_path(@forum), :notice => 'Topic was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @topic.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /topics/1
  # DELETE /topics/1.xml
  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy

    respond_to do |format|
      format.html { redirect_to(topics_url) }
      format.xml  { head :ok }
    end
  end
end
