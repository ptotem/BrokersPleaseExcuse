class WelcomeController < ApplicationController

  def index
    @tasks=Tasking.all
    @interaction=Interaction.new
    @interaction.taskings.build

  end
end
