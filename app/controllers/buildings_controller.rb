class BuildingsController < ApplicationController

  autocomplete :building, :name

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

    if params[:building_id].blank?
      @building = Building.new
      @building_selected = false
    else
      @building = Building.find(params[:building_id])
      @building_selected = true
    end


    @buildings = Building.all
    @localities = Locality.all
    @bhks=BhkConfig.all
    @sources=Flatype.all
    @furnstats=Furnstat.all
    @contacts=Contact.all
    @contact_types=Labelling.where("is_flat_contact_label=?",true).all
    @rent_year= RentYear.where('name=?', Time.now.year).first

    @flat = @building.flats.build
    @expected_rent = @flat.expected_rents.build
    @available_from = @flat.available_froms.build

    if params[:contact]
      @default_contact_id=params[:contact]
    else
      @default_contact_id=0
    end

    @flat_contacts=@flat.flat_contacts.build
    @contact=@flat.contacts.build
    @phone=@contact.phones.build
    @email=@contact.emails.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @building }
    end
  end

  # GET /buildings/1/edit
  def edit
    @building = Building.find(params[:building_id])
    @flat = Flat.find(params[:id])
    @expected_rent = @flat.expected_rents.last
    @available_from = @flat.available_froms.last

    @building_selected = true

    @buildings = Building.all
    @localities = Locality.all
    @bhks=BhkConfig.all
    @sources=Flatype.all
    @furnstats=Furnstat.all
    @moving_requirements=MovingRequirement.all
    @services=Service.all
    @contacts=Contact.all
    @contact_types=ContactType.all
    @qualities= Quality.all
    @restrictions= Restriction.all
    @rent_year= RentYear.where('name=?', Time.now.year).first

    @facilities=Facility.where("is_building=?", true)
    @features=Hash.new
    @facilities.each do |facility|
      @features[facility.name]=facility.facility_features
    end

    @flat_facilities=Facility.where("is_building=?", false)
    @flat_features=Hash.new
    @flat_facilities.each do |facility|
      @flat_features[facility.name]=facility.facility_features
    end


    @flat_contacts=@flat.flat_contacts.build
  #  @flat_photos=@flat.photos.build

    @building_service = @building.building_services.build
    @building_localities = @building.building_localities.build

    @contact=Contact.new
    @phone=@contact.phones.build
    @email=@contact.emails.build


    @flat.flat_notes.build
    @building.building_notes.build
    unless @building_quality= BuildingQuality.find_by_building_id(@building.id)
      @building_quality=@building.building_qualities.build
    end
    unless @approach_quality= ApproachQuality.find_by_building_id(@building.id)
      @approach_quality=@building.approach_qualities.build
    end

    unless @flat_restrictions= @flat.flat_restrictions
      @flat_restrictions=@flat.flat_restrictions.build
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @building }
    end

  end

  # POST /buildings
  # POST /buildings.json
  def create

    @building = Building.new(params[:building])

    @contact=Contact.new(params[:contact])

    respond_to do |format|

      if !@contact.name.blank? && @contact.save!
        format.html { redirect_to new_property_path(:contact=>params[:contact_id]), notice: 'Contact was successfully created.' }
      elsif !params[:selected_building].blank?
        @selected_building=Building.find(params[:selected_building])
        format.html { redirect_to new_property_path(@selected_building,:contact=>params[:contact_id]), notice: "You selected #{@selected_building.name}. Now add the flat." }
      else
        if @building.save
          format.html { redirect_to new_property_path(@building,:contact=>params[:contact_id]), notice: 'Building was successfully created.' }
          format.json { render json: @building, status: :created, location: @building }
        else
          format.html { render action: "new" }
          format.json { render json: @building.errors, status: :unprocessable_entity }
        end
      end

    end
  end

  # PUT /buildings/1
  # PUT /buildings/1.json
  def update
    @building = Building.find(params[:id])
    @contact=Contact.new(params[:contact])

    respond_to do |format|
      if @building.update_attributes(params[:building])
        if !@contact.name.blank?
          @contact.save!
        end

        if !params[:came_from_edit].nil?
          @flat=Flat.find(params[:came_from_edit])
          format.html { redirect_to edit_property_path(@building, @flat), notice: 'Building was successfully updated.' }
        end

        format.html { redirect_to flats_path, notice: 'Building was successfully updated.' }
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

  def get_contact_list
    @contacts=Contact.all
    contact_option=""
    @contacts.each do |contact|
      contact_option=contact_option+ "#{contact.id}--#{contact.name}|"


    end
    render :text=>contact_option

   #TODO: send only the contacts not included previously so the data processing becomes lighter

  end

  def save_photo_positions


    @no_of_records=params[:fields].count


    @no_of_records.times do |i|
      @photo=Photo.find(params[:fields][i][:photo_id])
      @photo.xpos=params[:fields][i][:xpos]
      @photo.ypos=params[:fields][i][:ypos]
      @photo.save!
    end

     render :text=>"DOne"


    end
end


