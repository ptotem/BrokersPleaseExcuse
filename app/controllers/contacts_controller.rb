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
    @contact = Contact.find(params[:id])
    @contacts = Contact.where("id!=?", @contact.id).all
    @connections = @contact.connections
    @connection = @contact.connections.build
    @labellings=Labelling.all
  end

  # GET /contacts/new
  # GET /contacts/new.json
  def new
    @contact = Contact.new
    @rltns = Rltn.all
  end

  # GET /contacts/1/edit
  def edit
    @contact = Contact.find(params[:id])
    @rltns = Rltn.all
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(params[:contact])

    if @contact.save
      @contact.connections.each do |connection|
        @other=Contact.find(connection.other_id)
        unless Connection.find_by_contact_id_and_other_id(@contact.id, @other.id).blank?
          @other.connection.create!(:other_id => @contact, :relationship => connection.relationship)
        end
      end
      respond_with @contact, :notice => 'Contact was successfully created.'
    end
  end

  # PUT /contacts/1
  # PUT /contacts/1.json
  def update
    @contact = Contact.find(params[:id])

    if @contact.update_attributes(params[:contact])
      @contact.connections.each do |connection|
        @other=Contact.find(connection.other_id)
        unless Connection.find_by_contact_id_and_other_id(@contact.id, @other.id).blank?
          Connection.create!(:contact_id => @other.id, :other_id => @contact.id, :relationship => connection.relationship)
        end
      end
      respond_with @contact, :notice=>'Contact was successfully updated.'
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    respond_with @contact, :notice=>'Contact was successfully created.'
  end
end
