class BuildingServicesController < ApplicationController

  # DELETE /buildings/1
  # DELETE /buildings/1.json
  def destroy
    @building_service= BuildingService.find(params[:id])
    @flat = Flat.find(params[:flat_id])
    @building=@flat.building
    @building_service.destroy

    respond_to do |format|
      format.html { redirect_to edit_property_flat_moreinfo_path(@building, @flat), notice:'Building Service was successfully deleted.' }
    end
  end

end
