class WelcomeController < ApplicationController

  def index
    @tasks=Tasking.order("due_date ").all
    @interactions=Interaction.order("interaction_date DESC")
    @interaction=Interaction.new
    @interaction.taskings.build

  end
end
