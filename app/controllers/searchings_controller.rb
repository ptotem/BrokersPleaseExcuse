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
    #render :text=>params[:searching][:searching_bhk_configs_attributes]["0"][:bhk_config_id]
    #return
    @searching = Searching.new(params[:searching])

    respond_to do |format|
      if @searching.save!
        @searching.searching_bhk_configs.first.delete
        @searching.searching_areas.first.delete
        @searching.searching_facilities.first.delete
        params[:searching][:searching_bhk_configs_attributes]["0"][:bhk_config_id].each do |id|
          SearchingBhkConfig.create!(:searching_id => @searching.id, :bhk_config_id => id) unless id.blank?
        end
        params[:searching][:searching_areas_attributes]["0"][:area_id].each do |id|
          SearchingArea.create!(:searching_id => @searching.id, :area_id => id) unless id.blank?
        end
        params[:searching][:searching_facilities_attributes]["0"][:facility_id].each do |id|
          SearchingFacility.create!(:searching_id => @searching.id, :facility_id => id) unless id.blank?
        end
        format.html { redirect_to search_result_path(@searching), notice: 'Here are your results...' }
      else
        format.html { redirect_to root_path, notice: 'Something went wrong...' }
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

  def results
    @search=Searching.find(params[:id])
    @score= Array.new
    @facility_list=Array.new

    @areas=@search.searching_areas
    @bhks=@search.searching_bhk_configs.map{|b| b.bhk_config_id}
    @facilities=@search.searching_facilities.map{|f| f.facility_id}
    @budget=@search.budget

    @localities=@areas.map { |sa| sa.area }.map { |a| a.localities }.flatten.map { |l| l.id }
    @buildings=Building.where(:primary_locality_id => @localities).all
    @flats=@buildings.map{|b| b.flats}.flatten.select{|f| @bhks.include?(f.bhk_config_id) }

    @flats.each_with_index do |flat,index|
      @score[index]=0
      if flat.expected_rents.last.name.between?(@budget*0.9,@budget*1.05)
        @score[index]+=32
      elsif flat.expected_rents.last.name.between?(@budget*0.85,@budget*1.1)
        @score[index]+=16
      elsif flat.expected_rents.last.name.between?(@budget*0.75,@budget*1.1)
        @score[index]+=8
      end
      @score[index]+=flat.overall_quality_score
      @facility_list[index]=flat.facilities.map{|f| f.id}+flat.building.facilities.map{|f| f.id}
      @facilities.each do |search|
        if @facility_list[index].include?(search)
          @score[index]+=30/@facilities.count
        end
      end
    end

    @flat_score=Hash.new
    @max=@score.max
    @flats.each_with_index do |flat,index|
      @flat_score[flat.id]=(@score[index].to_f/@max.to_f*100).round(0)
    end
    @sorted_score=@flat_score.sort_by{|key,value| value}.reverse

    #render :text => @sorted_score
    #return

  end

end
