class DealsController < ApplicationController
  # GET /deals
  # GET /deals.json
  def index
    @deals = Deal.all
    @broker_relation=DealRelation.find_by_name("Broker")
    @landlord_relation=DealRelation.find_by_name("Landlord")
    @employee_relation=DealRelation.find_by_name("Employee")
    @tenant_relation=DealRelation.find_by_name("Tenant")
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @deals }
    end
  end

  # GET /deals/1
  # GET /deals/1.json
  def show
    @deal = Deal.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @deal }
    end
  end

  # GET /deals/new
  # GET /deals/new.json
  def new
    @deal = Deal.new
    @deal.deal_contacts.build
    @contact=Contact.new
    @phone=@contact.phones.build
    @email=@contact.emails.build
    @contact_types=ContactType.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @deal }
    end
  end

  # GET /deals/1/edit
  def edit
    @deal = Deal.find(params[:id])
    @broker_relation=DealRelation.find_by_name("Broker")
    @landlord_relation=DealRelation.find_by_name("Landlord")
    @employee_relation=DealRelation.find_by_name("Employee")
    @tenant_relation=DealRelation.find_by_name("Tenant")
    @brokers=@deal.deal_contacts.where("deal_relation_id=?", @broker_relation.id).all.map{|x|x.contact_id}
    @landlords=@deal.deal_contacts.where("deal_relation_id=?", @landlord_relation.id).all.map{|x|x.contact_id}
    @tenants=@deal.deal_contacts.where("deal_relation_id=?", @tenant_relation.id).all.map{|x|x.contact_id}
    @employees=@deal.deal_contacts.where("deal_relation_id=?", @employee_relation.id).all.map{|x|x.contact_id}

  end

  # POST /deals
  # POST /deals.json
  def create


    @deal = Deal.new(params[:deal])
    #code to save contacts associated with the deal


    respond_to do |format|
      if @deal.save
        DealRelation.all.each do |dr|
          if !params[dr.name.to_s].nil?

            params[dr.name.to_s].each do |deal_contact|
              DealContact.create!(:deal_id => @deal.id, :contact_id => deal_contact.to_i, :deal_relation_id => dr.id)
            end
          end
        end
        format.html { redirect_to deals_path, notice: 'Deal was successfully created.' }
        format.json { render json: @deal, status: :created, location: @deal }
      else
        format.html { render action: "new" }
        format.json { render json: @deal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /deals/1
  # PUT /deals/1.json
  def update
    @deal = Deal.find(params[:id])

    respond_to do |format|
      if @deal.update_attributes(params[:deal])
        DealRelation.all.each do |dr|
          if !params[dr.name.to_s].nil?

            params[dr.name.to_s].each do |deal_contact|
              DealContact.create!(:deal_id => @deal.id, :contact_id => deal_contact.to_i, :deal_relation_id => dr.id)
            end
          end
        end
        format.html { redirect_to deals_path, notice: 'Deal was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @deal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deals/1
  # DELETE /deals/1.json
  def destroy
    @deal = Deal.find(params[:id])
    @deal.destroy

    respond_to do |format|
      format.html { redirect_to deals_url }
      format.json { head :no_content }
    end
  end
end
