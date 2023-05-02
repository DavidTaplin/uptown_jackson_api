class BuildingsController < ApplicationController
  def create
    building = Building.new(building_address: params[:building_address], building_contact_name: params[:building_contact_name], building_contact_email: params[:building_contact_email],square_footage: params[:square_footage])
    render json: 'he'
  end
end
