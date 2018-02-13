class EmergencyLocationsController < ApplicationController
  before_action :set_emergency_location, only: [:show, :edit, :update, :destroy]

  # GET /emergency_locations
  # GET /emergency_locations.json
  def index
    @emergency_locations = EmergencyLocation.all
  end

  # GET /emergency_locations/1
  # GET /emergency_locations/1.json
  def show
  end

  # GET /emergency_locations/new
  def new
    @emergency_location = EmergencyLocation.new
  end

  # GET /emergency_locations/1/edit
  def edit
  end

  # POST /emergency_locations
  # POST /emergency_locations.json
  def create
    @emergency_location = EmergencyLocation.new(emergency_location_params)

    respond_to do |format|
      if @emergency_location.save
        format.html { redirect_to @emergency_location, notice: 'Emergency location was successfully created.' }
        format.json { render :show, status: :created, location: @emergency_location }
      else
        format.html { render :new }
        format.json { render json: @emergency_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /emergency_locations/1
  # PATCH/PUT /emergency_locations/1.json
  def update
    respond_to do |format|
      if @emergency_location.update(emergency_location_params)
        format.html { redirect_to @emergency_location, notice: 'Emergency location was successfully updated.' }
        format.json { render :show, status: :ok, location: @emergency_location }
      else
        format.html { render :edit }
        format.json { render json: @emergency_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emergency_locations/1
  # DELETE /emergency_locations/1.json
  def destroy
    @emergency_location.destroy
    respond_to do |format|
      format.html { redirect_to emergency_locations_url, notice: 'Emergency location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_emergency_location
      @emergency_location = EmergencyLocation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def emergency_location_params
      params.fetch(:emergency_location, {})
    end
end
