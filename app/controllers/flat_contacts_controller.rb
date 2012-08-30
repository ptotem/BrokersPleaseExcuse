class FlatContactsController < ApplicationController

  # DELETE /buildings/1
  # DELETE /buildings/1.json
  def destroy
    @flat_contact= FlatContact.find(params[:id])
    @contact=@flat_contact.contact
    @flat_contact.destroy

    respond_to do |format|
      format.html { redirect_to @contact, notice:'Linked property was successfully deleted.' }
    end
  end

end
