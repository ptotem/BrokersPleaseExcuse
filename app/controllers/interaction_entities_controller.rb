class InteractionEntitiesController < ApplicationController
  # GET /interaction_entities
  # GET /interaction_entities.json
  def index
    @interaction_entities = InteractionEntity.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @interaction_entities }
    end
  end

  # GET /interaction_entities/1
  # GET /interaction_entities/1.json
  def show
    @interaction_entity = InteractionEntity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @interaction_entity }
    end
  end

  # GET /interaction_entities/new
  # GET /interaction_entities/new.json
  def new
    @interaction_entity = InteractionEntity.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @interaction_entity }
    end
  end

  # GET /interaction_entities/1/edit
  def edit
    @interaction_entity = InteractionEntity.find(params[:id])
  end

  # POST /interaction_entities
  # POST /interaction_entities.json
  def create
    @interaction_entity = InteractionEntity.new(params[:interaction_entity])

    respond_to do |format|
      if @interaction_entity.save
        format.html { redirect_to @interaction_entity, notice: 'Interaction entity was successfully created.' }
        format.json { render json: @interaction_entity, status: :created, location: @interaction_entity }
      else
        format.html { render action: "new" }
        format.json { render json: @interaction_entity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /interaction_entities/1
  # PUT /interaction_entities/1.json
  def update
    @interaction_entity = InteractionEntity.find(params[:id])

    respond_to do |format|
      if @interaction_entity.update_attributes(params[:interaction_entity])
        format.html { redirect_to @interaction_entity, notice: 'Interaction entity was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @interaction_entity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interaction_entities/1
  # DELETE /interaction_entities/1.json
  def destroy
    @interaction_entity = InteractionEntity.find(params[:id])
    @interaction_entity.destroy

    respond_to do |format|
      format.html { redirect_to interaction_entities_url }
      format.json { head :no_content }
    end
  end
end
