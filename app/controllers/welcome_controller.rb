class WelcomeController < ApplicationController

  def index
    @tasks=Tasking.order("created_at DESC").all
    @interactions=Interaction.all
    @interaction=Interaction.new
    @interaction.taskings.build

  end
end
