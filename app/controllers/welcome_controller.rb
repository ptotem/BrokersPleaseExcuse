class WelcomeController < ApplicationController

  def index
    @iam = Email.where("email=?",current_user.email).first.contact
    @assigned_to_me=Task.where("assigned_to = ?", @iam.id).all
    @also_me=Task.joins(:contacts).where(:contacts=>{:id=>@iam.id}).all

    @tasks=Array.new
    @tasks=@assigned_to_me+@also_me
  end
end
