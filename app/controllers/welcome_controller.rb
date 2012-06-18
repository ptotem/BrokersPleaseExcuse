class WelcomeController < ApplicationController

  def index
    @assigned_tasks = Tasking.where('assigned_to=?',current_user.contact_id).all
    @involved_interactions = InteractionContact.where('contact_id=?',current_user.contact.id).all.map{|i| i.interaction}
    logger.debug InteractionContact.where('contact_id=?',current_user.contact.id).all
    @involved_tasks = @involved_interactions.map{|i| i.taskings.first}
    @tasks=@assigned_tasks+@involved_tasks
    @interactions=Interaction.order("interaction_date DESC")
    @interaction=Interaction.new
    @interaction.taskings.build

  end
end
