class InteractionsController < ApplicationController
  # GET /interactions
  # GET /interactions.json
  def index
    @interactions = Interaction.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @interactions }
    end
  end

  # GET /interactions/1
  # GET /interactions/1.json
  def show
    @interaction = Interaction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @interaction }
    end
  end

  # GET /interactions/new
  # GET /interactions/new.json
  def new
    @interaction = Interaction.new
    @interaction.taskings.build
    if !params[:task_id].blank?
      @task=Tasking.find(params[:task_id])
      @prev_comment=params[:prev_comment]
      @primary_contact=@task.interaction.primary_contact_id
      @default_flats=@task.interaction.flats.map{|f| f.id}
      @tagged_contacts=@task.interaction.contacts.map{|c| c.id}
      @tagged_contacts << current_user.contact_id
    else
      if !params[:contact_id].blank?
      @primary_contact=params[:contact_id].to_i
      else
        @default_flats=params[:property_id]
      end
      @tagged_contacts=[current_user.contact_id]
      end

    if @task.nil?

    else


    end
    #   @interaction.interaction_entities.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @interaction }
    end
  end

  # GET /interactions/1/edit
  def edit
    @interaction = Interaction.find(params[:id])
  end

  # POST /interactions
  # POST /interactions.json
  def create

    #render :text=>params
    #return

    @interaction = Interaction.new(params[:interaction])
    respond_to do |format|
      if @interaction.save!
        if !params["prev_interaction_id"].nil?
          @prev_interaction=Interaction.find(params["prev_interaction_id"])
          @prev_interaction.taskings.each do |tasking|
            tasking.active=false
            tasking.save!
          end
          @interaction.name=params[:interaction][:name]+"\n"+@prev_interaction.name
          @prev_interaction.name=params["prev_comment"]+"\n"+@prev_interaction.name
          @prev_interaction.save!
        end
        logger.debug params
        logger.debug @interaction.interaction_contacts
        format.html { redirect_to :back, notice: 'Interaction was successfully created.' }
      else
        format.html { render :back, notice: 'Interaction could not be created.' }
      end
    end
  end

  # PUT /interactions/1
  # PUT /interactions/1.json
  def update
    @interaction = Interaction.find(params[:id])

    respond_to do |format|
      if @interaction.update_attributes(params[:interaction])
        format.html { redirect_to @interaction, notice: 'Interaction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @interaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interactions/1
  # DELETE /interactions/1.json
  def destroy
    @interaction = Interaction.find(params[:id])
    @interaction.destroy

    respond_to do |format|
      format.html { redirect_to interactions_url }
      format.json { head :no_content }
    end
  end
end
