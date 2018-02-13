class EmergencyDevicesController < ApplicationController
	skip_before_action :verify_authenticity_token
  # POST /emergency_conditions
  # POST /emergency_conditions.json
  def create
    puts "PP:: #{params.inspect}"
    @emergency_device = EmergencyDevice.new(emergency_device_params)

    respond_to do |format|
      if @emergency_device.save
        format.html { redirect_to root_path, notice: 'Emergency device was successfully registered.' }
        format.json { render :show, status: :created, location: root_url }
      else
        format.html { render :new }
        format.json { render json: @emergency_device.errors, status: :unprocessable_entity }
      end
    end
  end

  def emergency_device_params
  	params.require(:emergency_device).permit(:latitude, :longitude, :vehicle_type)
  end

end
