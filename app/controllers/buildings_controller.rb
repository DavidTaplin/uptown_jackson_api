class BuildingsController < ApplicationController

  def create
    building = Building.new(building_params)

    if building.save
      render_success(payload: building)
    else
      render_error(errors: building.errors.full_messages, status: 422)
    end
  end


  def index
    begin
      items_per_page = params.fetch(:per_page, 10).to_i
      pagy, buildings = pagy(Building.all, items: items_per_page)
      render_success(payload: { buildings: buildings, pagination: pagy_metadata(pagy) })
    rescue => e
      render_error(errors: "An error occurred while fetching buildings for page #{params.fetch(:page, 0).to_i}", status: 500)
    end
  end


  def show
    building = Building.find(params[:id])
    render_success(payload: building)
  rescue ActiveRecord::RecordNotFound
    render_error(errors: 'Building not found', status: 404)
  end


  def destroy
    building = Building.find(params[:id])
    building.destroy
    render_success(payload: 'Building deleted successfully')
  rescue ActiveRecord::RecordNotFound
    render_error(errors: 'Building not found', status: 404)
  end


  private

  def building_params
    params.require(:building).permit(:building_address, :building_contact_name, :building_contact_email, :square_footage, :image_url)
  end
end
