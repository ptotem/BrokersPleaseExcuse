class DealStagesController < ApplicationController
  # GET /deal_stages
  # GET /deal_stages.json
  def index
    @deal_stages = DealStage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @deal_stages }
    end
  end

  # GET /deal_stages/1
  # GET /deal_stages/1.json
  def show
    @deal_stage = DealStage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @deal_stage }
    end
  end

  # GET /deal_stages/new
  # GET /deal_stages/new.json
  def new
    @deal_stage = DealStage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @deal_stage }
    end
  end

  # GET /deal_stages/1/edit
  def edit
    @deal_stage = DealStage.find(params[:id])
  end

  # POST /deal_stages
  # POST /deal_stages.json
  def create
    @deal_stage = DealStage.new(params[:deal_stage])

    respond_to do |format|
      if @deal_stage.save
        format.html { redirect_to @deal_stage, notice: 'Deal stage was successfully created.' }
        format.json { render json: @deal_stage, status: :created, location: @deal_stage }
      else
        format.html { render action: "new" }
        format.json { render json: @deal_stage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /deal_stages/1
  # PUT /deal_stages/1.json
  def update
    @deal_stage = DealStage.find(params[:id])

    respond_to do |format|
      if @deal_stage.update_attributes(params[:deal_stage])
        format.html { redirect_to @deal_stage, notice: 'Deal stage was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @deal_stage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deal_stages/1
  # DELETE /deal_stages/1.json
  def destroy
    @deal_stage = DealStage.find(params[:id])
    @deal_stage.destroy

    respond_to do |format|
      format.html { redirect_to deal_stages_url }
      format.json { head :no_content }
    end
  end
end
