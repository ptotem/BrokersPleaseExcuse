class WelcomeController < ApplicationController

  skip_before_filter :authenticate_user!, :only=>:home

  def home
    @searching=Searching.new

    @searching_bhk_config=@searching.searching_bhk_configs.build
    @searching_area=@searching.searching_areas.build
    @searching_facility=@searching.searching_facilities.build

    @bhk_configs=BhkConfig.all
    @areas=Area.all
    @facilities=Facility.all

  end

  def index
    @assigned_tasks = Tasking.where('assigned_to=?',current_user.contact_id).all
    @involved_interactions = InteractionContact.where('contact_id=?',current_user.contact.id).all.map{|i| i.interaction}
    @involved_tasks = @involved_interactions.map{|i| if i.taskings.count>0 then i.taskings.first end}.compact
    if current_user.admin
      @tasks=Tasking.all
    else
      @tasks=(@assigned_tasks+@involved_tasks).uniq ||=[]
    end

    @interactions=Interaction.order("interaction_date DESC")
    @interaction=Interaction.new
    @interaction.taskings.build
  end
end
