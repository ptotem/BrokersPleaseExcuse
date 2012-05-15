class BuildingsController < ApplicationController
  # GET /buildings
  # GET /buildings.json
  def index
    @buildings = Building.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @buildings }
    end
  end

  # GET /buildings/1
  # GET /buildings/1.json
  def show
    @building = Building.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @building }
    end
  end

  # GET /buildings/new
  # GET /buildings/new.json
  def new
    @building = Building.new
    @buildings = Building.all
    @flat = @building.flats.build
    @flats=@building.flats
    @bhk_configs=BhkConfig.all

    @building_service = @building.building_services.build
    @building_services=@building.building_services
    @services=Service.all

    @localities=Locality.all
    @moving_requirements=MovingRequirement.all
    @facilities=Facility.where("is_building=?", true)

    @features=Hash.new
    @facilities.each do |facility|
      @features[facility.name]=facility.facility_features
    end

    @restrictions=Restriction.all
    @qualities=Quality.all

    @bldgq=@building.building_qualities.build
    @appq=@building.approach_qualities.build
    @mc=@building.moving_charges.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @building }
    end
  end

  # GET /buildings/1/edit
  def edit
    @building = Building.find(params[:id])
    @buildings = Building.all
    @flat = @building.flats.build
    @flats=@building.flats
    @bhk_configs=BhkConfig.all

    @building_service = @building.building_services.build
    @building_services=@building.building_services
    @services=Service.all


    @localities=Locality.all
    @moving_requirements=MovingRequirement.all
    @facilities=Facility.where("is_building=?", true)

    @features=Hash.new
    @facilities.each do |facility|
      @features[facility.name]=facility.facility_features
    end

    @restrictions=Restriction.all
    @qualities=Quality.all

    unless @bldgq=@building.building_qualities.first
    @bldgq=@building.building_qualities.build
    end

    unless @appq=@building.approach_qualities.first
    @appq=@building.approach_qualities.build
    end

    unless @mc=@building.moving_charges.first
    @mc=@building.moving_charges.build
    end

  end

  # POST /buildings
  # POST /buildings.json
  def create
    @building = Building.new(params[:building])

    respond_to do |format|
      if @building.save
        format.html { redirect_to edit_building_path(@building), notice: 'Building was successfully created.' }
        format.json { render json: @building, status: :created, location: @building }
      else
        format.html { render action: "new" }
        format.json { render json: @building.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /buildings/1
  # PUT /buildings/1.json
  def update
    @building = Building.find(params[:id])

    respond_to do |format|
      if @building.update_attributes(params[:building])
        format.html { redirect_to edit_building_path(@building), notice: 'Building was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @building.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buildings/1
  # DELETE /buildings/1.json
  def destroy
    @building = Building.find(params[:id])
    @building.destroy

    respond_to do |format|
      format.html { redirect_to buildings_url }
      format.json { head :no_content }
    end
  end
end
