class VotesController < ApplicationController
  before_filter :authenticate_user!

  # GET /votes
  # GET /votes.xml
  def index
    @votes = current_user.votes

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @votes }
    end
  end

  # GET /votes/1
  # GET /votes/1.xml
  def show
    @vote = current_user.votes.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @vote }
    end
  end

  # GET /votes/new
  # GET /votes/new.xml
  def new
    @vote = current_user.votes.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @vote }
    end
  end

  # GET /votes/1/edit
  def edit
    @vote = current_user.votes.find(params[:id])
  end

  # POST /votes
  # POST /votes.xml
  def create
    @vote = current_user.votes.new(params[:vote])



  

    respond_to do |format|
      if @vote.save
        format.html { redirect_to(user_vote_path(current_user, @vote), :notice => 'Vote was successfully created.') }
        format.xml  { render :xml => @vote, :status => :created, :location => @vote }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @vote.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /votes/1
  # PUT /votes/1.xml
  def update
    @vote = current_user.votes.find(params[:id])

    respond_to do |format|
      if @vote.update_attributes(params[:vote])
        format.html { redirect_to(user_vote_path(current_user, @vote), :notice => 'Vote was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @vote.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /votes/1
  # DELETE /votes/1.xml
  def destroy
    @vote = current_user.votes.find(params[:id])
    @vote.destroy

    respond_to do |format|
      format.html { redirect_to(user_votes_url) }
      format.xml  { head :ok }
    end
  end
end
