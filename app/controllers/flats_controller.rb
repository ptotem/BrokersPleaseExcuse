class FlatsController < ApplicationController

  skip_before_filter :authenticate_user!, :only => [:show, :index]


  # GET /flats
  # GET /flats.json
  def index
    if current_user
      @flats = Flat.all
    else
      @flats = Flat.where('displayed=? and approved=?', true, true).all
    end

    @facilities=Facility.where("is_building=?", true)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @flats }
    end
  end

  def quick_index
    if current_user
      @flats = Flat.all
    else
      @flats = Flat.where('displayed=? and approved=?', true, true).all
    end

    @facilities=Facility.where("is_building=?", true)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @flats }
    end
  end

  # GET /flats/1
  # GET /flats/1.json
  def show

    if current_user
      @flat = Flat.find(params[:id])
    elsif Flat.find(params[:id]).displayed and Flat.find(params[:id]).approved
      @flats = Flat.find(params[:id])
    else
      @flat=nil
    end

    @building = @flat.building
    @building_quality=Quality.find(@building.building_quality_id)
    @approach_quality=Quality.find(@building.approach_quality_id)
    @interiors_quality=Quality.find(@flat.interiors_quality_id)
    @view_quality=Quality.find(@flat.view_quality_id)

    @locality_quality=@building.main_locality.quality
    @overall_quality_value = ((@building_quality.value*2+@interiors_quality.value*2+@locality_quality.value*2+@approach_quality.value+@view_quality.value).to_f/8.0).round(0)
    @overall_quality_name = Quality.find_by_value(@overall_quality_value).name
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @flat }
    end
  end

  # GET /flats/new
  # GET /flats/new.json
  def new
    @flat = Flat.new
    @bhk_configs = BhkConfig.all
    @flatypes= Flatype.all
    @furnstat= Furnstat.all
    @directions= Direction.all
    @qualities= Quality.all

    @intq=@flat.interiors_qualities.build
    @vq=@flat.view_qualities.build

    @facilities=Facility.where("is_building=?", true)

    @features=Hash.new
    @facilities.each do |facility|
      @features[facility.name]=facility.facility_features
    end


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @flat }
    end
  end

  # GET /flats/1/edit
  def edit
    @flat = Flat.find(params[:id])
    @building = Building.find(params[:building_id])

    @bhk_configs = BhkConfig.all
    @flatypes= Flatype.all
    @furnstats= Furnstat.all
    @directions= Direction.all
    @qualities= Quality.all

    @intq=@flat.interiors_qualities.build
    @vq=@flat.view_qualities.build

    @facilities=Facility.where("is_building=?", false)

    @features=Hash.new
    @facilities.each do |facility|
      @features[facility.name]=facility.facility_features
    end


  end

  # POST /flats
  # POST /flats.json
  def create
    @flat = Flat.new(params[:flat])

    respond_to do |format|
      if @flat.save
        format.html { redirect_to @flat, notice: 'Flat was successfully created.' }
        format.json { render json: @flat, status: :created, location: @flat }
      else
        format.html { render action: "new" }
        format.json { render json: @flat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /flats/1
  # PUT /flats/1.json
  def update
    @flat = Flat.find(params[:id])
    @flat.save
    respond_to do |format|
      if @flat.update_attributes(params[:flat])
        format.html { redirect_to @flat, notice: 'Flat was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @flat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flats/1
  # DELETE /flats/1.json
  def destroy
    @flat = Flat.find(params[:id])
    @flat.destroy

    respond_to do |format|
      format.html { redirect_to flats_url }
      format.json { head :no_content }
    end
  end

  def notes
    @flat = Flat.find(params[:flat_id])
    @building = @flat.building
    @building_quality=Quality.find(@building.building_quality_id)
    @approach_quality=Quality.find(@building.approach_quality_id)
    @interiors_quality=Quality.find(@flat.interiors_quality_id)
    @view_quality=Quality.find(@flat.view_quality_id)
    @flat.flat_notes.build
    unless @flat.available_froms
      @flat.available_froms.build
    end
    unless @flat.expected_rents
      @flat.expected_rents.build
    end
    @locality_quality=@building.main_locality.quality
    @overall_quality_value = ((@building_quality.value*2+@interiors_quality.value*2+@locality_quality.value*2+@approach_quality.value+@view_quality.value).to_f/8.0).round(0)
    @overall_quality_name = Quality.find_by_value(@overall_quality_value).name
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @flat }
    end
  end

  def flatasks

    @flat_page=true

    @flat = Flat.find(params[:id])
    @building = @flat.building
    @building_quality=Quality.find(@building.building_quality_id)
    @approach_quality=Quality.find(@building.approach_quality_id)
    @interiors_quality=Quality.find(@flat.interiors_quality_id)
    @view_quality=Quality.find(@flat.view_quality_id)
    @locality_quality=@building.main_locality.quality
    @overall_quality_value = ((@building_quality.value*2+@interiors_quality.value*2+@locality_quality.value*2+@approach_quality.value+@view_quality.value).to_f/8.0).round(0)
    @overall_quality_name = Quality.find_by_value(@overall_quality_value).name

    @involved_interactions = InteractionFlat.where('flat_id=?', @flat.id).all.map { |i| i.interaction }
    @tasks = @involved_interactions.map { |i| i.taskings.first }.compact.uniq

    @interactions=@involved_interactions
    @interaction=Interaction.new
    @interaction.taskings.build

  end



end
