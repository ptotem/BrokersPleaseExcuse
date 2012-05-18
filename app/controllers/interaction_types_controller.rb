class InteractionTypesController < ApplicationController
  # GET /interaction_types
  # GET /interaction_types.json
  def index
    @interaction_types = InteractionType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @interaction_types }
    end
  end

  # GET /interaction_types/1
  # GET /interaction_types/1.json
  def show
    @interaction_type = InteractionType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @interaction_type }
    end
  end

  # GET /interaction_types/new
  # GET /interaction_types/new.json
  def new
    @interaction_type = InteractionType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @interaction_type }
    end
  end

  # GET /interaction_types/1/edit
  def edit
    @interaction_type = InteractionType.find(params[:id])
  end

  # POST /interaction_types
  # POST /interaction_types.json
  def create
    @interaction_type = InteractionType.new(params[:interaction_type])

    respond_to do |format|
      if @interaction_type.save
        format.html { redirect_to @interaction_type, notice: 'Interaction type was successfully created.' }
        format.json { render json: @interaction_type, status: :created, location: @interaction_type }
      else
        format.html { render action: "new" }
        format.json { render json: @interaction_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /interaction_types/1
  # PUT /interaction_types/1.json
  def update
    @interaction_type = InteractionType.find(params[:id])

    respond_to do |format|
      if @interaction_type.update_attributes(params[:interaction_type])
        format.html { redirect_to @interaction_type, notice: 'Interaction type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @interaction_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interaction_types/1
  # DELETE /interaction_types/1.json
  def destroy
    @interaction_type = InteractionType.find(params[:id])
    @interaction_type.destroy

    respond_to do |format|
      format.html { redirect_to interaction_types_url }
      format.json { head :no_content }
    end
  end
end
