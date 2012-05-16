class WelcomeController < ApplicationController

  def index
    @tasks=Tasking.all

  end
end
