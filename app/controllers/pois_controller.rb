class PoisController < ApplicationController

  # GET /pois/new
  # GET /pois/new.json
  def new
    @poi = Poi.new
    @pois = Poi.all
    @localities = Locality.all
    @poi_type_ids = PoiType.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @poi }
    end
  end

  # GET /pois/1/edit
  def edit
    @poi = Poi.find(params[:id])
  end

  # POST /pois
  # POST /pois.json
  def create
    @poi = Poi.new(params[:poi])

    respond_to do |format|
      if @poi.save
        format.html { redirect_to new_poi_path, notice: 'Poi was successfully created.' }
      end
    end
  end

  # PUT /pois/1
  # PUT /pois/1.json
  def update
    @poi = Poi.find(params[:id])

    respond_to do |format|
      if @poi.update_attributes(params[:poi])
        format.html { redirect_to @poi, notice: 'Poi was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @poi.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pois/1
  # DELETE /pois/1.json
  def destroy
    @poi = Poi.find(params[:id])
    @poi.destroy

    respond_to do |format|
      format.html { redirect_to pois_url }
      format.json { head :no_content }
    end
  end
end
