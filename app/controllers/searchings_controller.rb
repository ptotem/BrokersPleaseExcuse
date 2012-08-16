class SearchingsController < ApplicationController

  skip_before_filter :authenticate_user!

  # GET /searchings
  # GET /searchings.json
  def index
    @searchings = Searching.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @searchings }
    end
  end

  # GET /searchings/1
  # GET /searchings/1.json
  def show
    @searching = Searching.find(params[:id])

    @searching.searching_bhk_configs.build
    @searching.searching_areas.build
    @searching.searching_facilities.build

    @bhk_configs=BhkConfig.all
    @areas=Area.all
    @facilities=Facility.all


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @searching }
    end
  end

  # GET /searchings/new
  # GET /searchings/new.json
  def new
    @searching = Searching.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @searching }
    end
  end

  # GET /searchings/1/edit
  def edit
    @searching = Searching.find(params[:id])
  end

  # POST /searchings
  # POST /searchings.json
  def create
    @searching = Searching.new(params[:searching])

    respond_to do |format|
      if @searching.save
        format.html { redirect_to @searching, notice: 'Searching was successfully created.' }
        format.json { render json: @searching, status: :created, location: @searching }
      else
        format.html { render action: "new" }
        format.json { render json: @searching.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /searchings/1
  # PUT /searchings/1.json
  def update
    @searching = Searching.find(params[:id])

    respond_to do |format|
      if @searching.update_attributes(params[:searching])
        format.html { redirect_to @searching, notice: 'Searching was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @searching.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /searchings/1
  # DELETE /searchings/1.json
  def destroy
    @searching = Searching.find(params[:id])
    @searching.destroy

    respond_to do |format|
      format.html { redirect_to searchings_url }
      format.json { head :no_content }
    end
  end
end
