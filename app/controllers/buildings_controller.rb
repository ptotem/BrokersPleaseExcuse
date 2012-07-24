class BuildingsController < ApplicationController

  autocomplete :building, :name

  # GET /buildings
  # GET /buildings.json
  def index
    @buildings = Building.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json :@buildings }
    end
  end

  # GET /buildings/1
  # GET /buildings/1.json
  def show
    @building = Building.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json :@building }
    end
  end

  # GET /buildings/new
  # GET /buildings/new.json
  def quick_form

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
    @labellings=Labelling.where("is_flat_contact_label=?", true).all
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
    @contact_types=ContactType.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json :@building }
    end
  end

  # GET /buildings/1/edit
  def detailed_form
    @building = Building.find(params[:building_id])
    @flat = Flat.find(params[:id])

    @buildings = Building.all
    @localities = Locality.all
    @bhks=BhkConfig.all
    @sources=Flatype.all
    @furnstats=Furnstat.all
    @contacts=Contact.all
    @labellings=Labelling.where("is_flat_contact_label=?", true).all
    @rent_year= RentYear.where('name=?', Time.now.year).first

    unless @expected_rent = @flat.expected_rents.first
      @expected_rent=@flat.expected_rents.build
    end
    unless @available_from = @flat.available_froms.first
      @available_from = @flat.available_froms.build
    end

    if params[:contact]
      @default_contact_id=params[:contact]
    else
      @default_contact_id=0
    end

    @flat_contacts=@flat.flat_contacts.build
    @contact=@flat.contacts.build
    @phone=@contact.phones.build
    @email=@contact.emails.build
    @contact_types=ContactType.all


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json :@building }
    end
  end

  def building_location

    @building = Building.find(params[:building_id])
    @flat=Flat.find(params[:id])
    @localities=Locality.all
    @pois=Poi.where('poi_type_id=?', PoiType.find_by_name('Building').id).all
    @building.building_localities.build
    @building.building_routes.build unless !@building.building_routes.blank?

  end

  def building_features
    @building = Building.find(params[:building_id])
    @flat = Flat.find(params[:id])
    #@json = Building.all.to_gmaps4rails
    #@markers = Building.all.to_gmaps4rails    #@markers contain valid json to pass to the view

    @moving_requirements=MovingRequirement.all
    @qualities= Quality.all

    @facilities=Facility.where("is_building=?", true)
    @features=Hash.new
    @facilities.each do |facility|
      @features[facility.name]=facility.facility_features
    end

    @building.building_notes.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json :@building }
    end

  end

  def flat_features

    @flat = Flat.find(params[:id])
    @building = @flat.building

    @qualities = Quality.all
    @restrictions = Restriction.all
    @directions = Direction.all

    @flat_facilities = Facility.where("is_building=?", false)
    @flat_features = Hash.new
    @flat_facilities.each do |facility|
      @flat_features[facility.name] = facility.facility_features
    end

    @flat.flat_notes.build

    unless @flat_restrictions = @flat.flat_restrictions
      @flat_restrictions=@flat.flat_restrictions.build
    end

    @bathrooms=@flat.bathrooms
    @parkings=@flat.parkings
    @balconies=@flat.balconies

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json :@building }
    end

  end

  def photos
    @building = Building.find(params[:building_id])
    @flat = Flat.find(params[:id])
    @photos = Photo.all
    @photo = Photo.new
  end

  def moreinfo
    @building = Building.find(params[:building_id])
    @flat = Flat.find(params[:id])
    @services = Service.all
    @building_services=@building.building_services
    @building.building_services.build

  end

  def terms
    @building = Building.find(params[:building_id])
    @flat = Flat.find(params[:id])

  end

  def tag_photos
    @building = Building.find(params[:building_id])
    @flat = Flat.find(params[:id])
    @photos = Photo.all
    @photo = Photo.new
  end


  # POST /buildings
  # POST /buildings.json
  def create

    @building = Building.new(params[:building])
    @contact=Contact.new(params[:contact])

    respond_to do |format|
      if !@contact.name.blank? && @contact.save!
        format.html { redirect_to new_property_path(:contact => params[:contact_id]), notice:'Contact was successfully created.' }
      elsif !params[:selected_building].blank?
        @selected_building=Building.find(params[:selected_building])
        format.html { redirect_to new_property_path(@selected_building, :contact => params[:contact_id]), notice:"You selected #{@selected_building.name}. Now add the flat." }
      else
        if @building.save
          format.html { redirect_to new_property_path(@building, :contact => params[:contact_id]), notice:'Building was successfully created.' }
        else
          format.html { redirect_to new_property_path(@building, :contact => params[:contact_id]), :notice => "Property could not be created. You must choose a building and put in the flat name and configuration" }
        end
      end

    end
  end

  # PUT /buildings/1
  # PUT /buildings/1.json
  def update

    @building = Building.find(params[:id])

    @contact = Contact.new(params[:contact])

    respond_to do |format|

      if !@contact.name.blank?
        @contact.save!
      end

      #if params[:building][:flats_attributes].blank?
      #  format.html { redirect_to new_property_path(@building, :contact => @contact.id), :notice => "Property could not be created. You must choose a building and put in the flat name and configuration"}
      #elsif @building.update_attributes(params[:building])

      # TODO Put in the validations for blank form submits using client-side validations

      if @building.update_attributes(params[:building])

        case params[:came_from]
          when nil
            @flat=Flat.last
            format.html { redirect_to edit_property_basic_path(@building, @flat), notice:'Property was successfully created.' }
          when 'basic'
            @flat=Flat.find(params[:flat_id])
            format.html { redirect_to edit_property_location_path(@building, @flat), notice:'Basic Property data was successfully updated.' }
          when 'location'
            @flat=Flat.find(params[:flat_id])
            format.html { redirect_to edit_property_building_features_path(@building, @flat), notice:'Property Location details were successfully updated.' }
          when 'building_features'
            @flat=Flat.find(params[:flat_id])
            format.html { redirect_to edit_property_flat_features_path(@building, @flat), notice:'Building Features were successfully updated.' }
          when 'flat_features'
            @flat=Flat.find(params[:flat_id])
            unless params[:flat].blank?
              @facility_ids= params[:flat][:facility_ids]
              @facility_feature_ids= params[:flat][:facility_feature_ids]
              unless params[:flat][:facility_ids].blank?
                FlatFacility.find_all_by_flat_id(@flat).each do |facility|
                  facility.destroy
                end
                FlatFacilityFeature.find_all_by_flat_id(@flat).each do |feature|
                  feature.destroy
                end
              end
              unless params[:flat][:facility_feature_ids].blank?
                @facility_ids.each do |facility_id|
                  FlatFacility.create!(:flat_id => @flat.id, :facility_id => facility_id)
                end
                @facility_feature_ids.each do |feature_id|
                  FlatFacilityFeature.create!(:flat_id => @flat.id, :facility_feature_id => feature_id)
                end
              end

              @restriction_ids=params[:flat][:restriction_ids]
              unless params[:flat][:restriction_ids].blank?
                FlatRestriction.find_all_by_flat_id(@flat).each do |restriction|
                  restriction.destroy
                end
                @restriction_ids.each do |restriction_id|
                  FlatRestriction.create!(:flat_id => @flat.id, :restriction_id => restriction_id)
                end
              end

            end
            format.html { redirect_to edit_property_flat_photos_path(@building, @flat), notice:'Flat Utilities and Features were successfully updated.' }
          when 'photos'
            @flat=Flat.find(params[:flat_id])
            @building=@flat.building

            if params[:flat]
              params[:flat][:photos_attributes].count.times do |i|
                Photo.create!(:image => params[:flat][:photos_attributes][i][:image], :flat_id => params[:flat_id], :tagging_allowed => true)
              end
            end
            if params[:external]=="true"
              format.html { redirect_to edit_property_flat_moreinfo_path(@building, @flat), notice:'Photos were successfully updated.' }
            else
              format.html { redirect_to edit_property_flat_photos_path(@building, @flat), notice:'Photos were successfully uploaded.' }
            end
          when 'moreinfo'
            @flat=Flat.find(params[:flat_id])
            @building=@flat.building
            if params[:external]=="true"
              format.html { redirect_to edit_property_terms_path(@building, @flat), notice:'Building Services were successfully updated.' }
            else
              format.html { redirect_to edit_property_flat_moreinfo_path(@building, @flat), notice:'Building Service was created.' }
            end
          when 'terms'
            @flat=Flat.find(params[:flat_id])
            @building=@flat.building
            if params[:external]=="true"
              format.html { redirect_to edit_property_basic_path(@building, @flat), notice:'Terms were successfully updated.' }
            else
              format.html { redirect_to show_property_path(@flat), notice:'Terms were successfully updated.' }
            end

        end
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
    render :text => contact_option

    #TODO: send only the contacts not included previously so the data processing becomes lighter

  end


end


