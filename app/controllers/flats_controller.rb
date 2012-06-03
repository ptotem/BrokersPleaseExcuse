class FlatsController < ApplicationController
  # GET /flats
  # GET /flats.json
  def index
    @flats = Flat.all

    @facilities=Facility.where("is_building=?", true)
    @features=Hash.new
    @facilities.each do |facility|
      @features[facility.name]=facility.facility_features
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @flats }
    end
  end

  # GET /flats/1
  # GET /flats/1.json
  def show
    @flat = Flat.find(params[:id])
    @building_quality=@flat.building.building_qualities.first.quality
    @approach_quality=@flat.building.approach_qualities.first.quality
    @interiors_quality=@flat.interiors_qualities.first.quality
    @view_quality=@flat.view_qualities.first.quality
    @locality_quality=@flat.building.main_locality.quality
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
end
