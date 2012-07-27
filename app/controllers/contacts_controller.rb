class ContactsController < ApplicationController

  respond_to :html, :js

  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = Contact.all
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
    @contact_page=true
    @contact = Contact.find(params[:id])
    @new_contact=Contact.new
    @phones=@new_contact.phones.build
    @emails=@new_contact.emails.build
    @contacts = Contact.where("id!=?", @contact.id).all
    @connections = @contact.connections
    @connection = @contact.connections.build
    @flat_contact = @contact.flat_contacts.build
    @flat_contacts = @contact.flat_contacts
    @labellings=Labelling.where("is_flat_contact_label=?", true)

    # @tasks=Tasking.order("due_date ").all
    @assigned_tasks = Tasking.where('assigned_to=?', @contact.id).all
    @involved_interactions = InteractionContact.where('contact_id=?', @contact.id).all.map { |i| i.interaction }
    @involved_interactions.concat(Interaction.where("primary_contact_id=?",@contact.id).all).compact
    @involved_tasks = @involved_interactions.map { |i| i.taskings.first }.compact
    @tasks=(@assigned_tasks+@involved_tasks).uniq

    #@interactions=Interaction.order("interaction_date DESC")
    @interactions=@involved_interactions
    @interaction=Interaction.new
    @interaction.taskings.build

  end

  # GET /contacts/new
  # GET /contacts/new.json
  def new
    @contact = Contact.new
    @contact_types= ContactType.all
    @contact.phones.build
    @contact.emails.build
    @contact.addresses.build
    @building_selected=true

  end

  # GET /contacts/1/edit
  def edit
    @contact = Contact.find(params[:id])
    @contact_types= ContactType.all
  end

  # POST /contacts
  # POST /contacts.json
  def create
    #render :text=>params
    #return
    @contact = Contact.new(params[:contact])
    respond_to do |format|
      if @contact.save
        @contact.connections.each do |connection|
          @other=Contact.find(connection.other_id)
          unless Connection.find_by_contact_id_and_other_id(@contact.id, @other.id).blank?
            @other.connection.create!(:other_id => @contact, :relationship => connection.relationship)
          end
        end
        if params[:flat_id]!="0"
          @flat=Flat.find(params[:flat_id])
          format.html { redirect_to edit_property_basic_path(@flat.building, @flat), :notice => 'Contact was successfully created.' }
        else
          format.html { redirect_to @contact, :notice => 'Contact was successfully created.' }
        end
      else
        format.html { redirect_to new_contact_path, :alert => @contact.errors.full_messages.join(", ") }
      end

    end
  end

  # PUT /contacts/1
  # PUT /contacts/1.json
  def update

    @contact = Contact.find(params[:id])

    if @contact.update_attributes(params[:contact])
      #  @contact.connections.each do |connection|
      #    @other=Contact.find(connection.other_id)
      #    unless Connection.find_by_contact_id_and_other_id(@contact.id, @other.id).blank?
      #      Connection.create!(:contact_id => @other.id, :other_id => @contact.id, :relationship => connection.relationship)
      #    end
      # end
      redirect_to @contact, :notice => 'Contact was successfully updated.'
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    respond_with @contact, :notice => 'Contact was successfully created.'
  end
end
