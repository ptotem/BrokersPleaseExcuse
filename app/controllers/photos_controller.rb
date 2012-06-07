#TODO: get the routing correct

class PhotosController < ApplicationController
  # GET /photos
  # GET /photos.json
  def index
    @flat=Flat.find(params[:flat_id])
    @photos = Photo.all
    @photo=Photo.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @photos }
    end
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    @photo = Photo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @photo }
    end
  end

  # GET /photos/new
  # GET /photos/new.json

  def new
    @photo = Photo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @photo }
    end
  end

  # GET /photos/1/edit
  def edit
    @photo = Photo.find(params[:id])
  end

  # POST /photos
  # POST /photos.json
  def create


    @flat=Flat.find(params[:photo][:flat_id])
    @building=@flat.building
    params[:photo][:image].count.times do |i|
      @photo=Photo.create!(:image => params[:photo][:image][i], :flat_id => params[:photo][:flat_id], :tagging_allowed => true)
    end
    #@photo = Photo.new(params[:photo])

    respond_to do |format|
      if @photo.save
        format.html { redirect_to edit_property_flat_photos_path(@building,@flat), notice: 'Photo was successfully created.' }
        format.json { render json: @photo, status: :created, location: @photo }
      else
        format.html { render action: "new" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /photos/1
  # PUT /photos/1.json
  def update
    @photo = Photo.find(params[:id])

    respond_to do |format|
      if @photo.update_attributes(params[:photo])
        format.html { redirect_to edit_property_flat_photos_path(@photo.flat.building,@photo.flat), notice: 'Photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo = Photo.find(params[:id])
    flat_id=@photo.flat_id
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to photos_url(:flat_id => flat_id) }
      format.json { head :no_content }
    end
  end

  def update_photo_sequence


    @flat=Flat.find(params["flat_id"])
    @flat.photos.each_with_index do |photo, index|

      photo.sequence_number=params[photo.id.to_s]
      photo.save!
    end
    render :text => "OK"

  end

  def delete_all_photos
    @flat=Flat.find(params[:flat_id])
    @flat.photos.destroy_all
    redirect_to photos_path(:flat_id => @flat.id)
  end

  def make_showcase_image
    @photo=Photo.find(params[:photo_id])
    @flat=@photo.flat
    @flat.photos.each do |photo|
      photo.showcase_image=false
      photo.save!
    end


    @photo.showcase_image=true
    @photo.save!
    redirect_to photos_path(:flat_id=>@photo.flat_id)
  end
end
