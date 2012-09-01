class WelcomeController < ApplicationController

  skip_before_filter :authenticate_user!, :only=>:home

  def home
    @searching=Searching.new

    @searching.searching_bhk_configs.build
    @searching.searching_areas.build
    @searching.searching_facilities.build

    @bhk_configs=BhkConfig.all
    @areas=Area.all
    @facilities=Facility.all

    @budget_options=[[20000,20000],[25000,25000],[28000,28000],[30000,30000],[35000,35000],[40000,40000],[42000,42000],[45000,45000],[50000,50000]]

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
