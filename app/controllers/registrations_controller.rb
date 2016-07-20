class RegistrationsController < ApplicationController

  def create
    @registration = registration_params[:user_id].present? ? Registration.find_or_create_by(user_id: registration_params[:user_id]) : Registration.create(registration_params)
    @registration.registration_id =  registration_params[:registration_id] if registration_params[:registration_id].present?
    @registration.device_name = registration_params[:device_name]
    respond_to do |format|
      if @registration.save
        # format.html { redirect_to @registration, notice: 'Registered successfully' }
        # format.json { render :show, status: :created, location: @registration }
        format.json { render json: @registration }
      else
        format.html { render :new }
        format.json { render json: @registration.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def registration_params
      params.require(:registration).permit(:id, :user_id, :registration_id, :device_name)
    end
end