class EmergencyConditionsController < ApplicationController
  before_action :set_emergency_condition, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token
  # GET /emergency_conditions
  # GET /emergency_conditions.json
  def index
    @emergency_conditions = if params[:type] == "active"
      EmergencyCondition.active_emergencies
    elsif params[:type] == "accepted"
      EmergencyCondition.accepted_emergencies
    else
      EmergencyCondition.all
    end
  end

  # GET /emergency_conditions/1
  # GET /emergency_conditions/1.json
  def show
  end

  # GET /emergency_conditions/new
  def new
    @emergency_condition = EmergencyCondition.new
    @last_ten_emergencies = EmergencyCondition.where.not(address:nil, phone_number: nil, pincode: nil).last(2).reverse
  end

  def accept_emergency
    emergency = EmergencyCondition.find(params[:id])
    emergency.accepted_at = Time.now
    emergency.accepted!
    emergency.save!
    redirect_to emergency_conditions_path, notice: "Emergency accepted"
  end

  def cancel_emergency
    emergency = EmergencyCondition.find(params[:id])
    emergency.cancelled!
    emergency.save!
    redirect_to emergency_conditions_path, notice: "Emergency cancelled"
  end

  # GET /emergency_conditions/1/edit
  def edit
  end

  # POST /emergency_conditions
  # POST /emergency_conditions.json
  def create
    puts "PP:: #{params.inspect}"
    @emergency_condition = EmergencyCondition.new(emergency_condition_params)

    respond_to do |format|
      if @emergency_condition.save
        format.html { redirect_to new_emergency_condition_path, notice: 'Emergency condition was successfully created.' }
        format.json { render :show, status: :created, location: @emergency_condition }
      else
        format.html { redirect_to new_emergency_condition_path,  notice: 'Error in starting emergency'}
        format.json { render json: @emergency_condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /emergency_conditions/1
  # PATCH/PUT /emergency_conditions/1.json
  def update
    respond_to do |format|
      if @emergency_condition.update(emergency_condition_params)
        format.html { redirect_to @emergency_condition, notice: 'Emergency condition was successfully updated.' }
        format.json { render :show, status: :ok, location: @emergency_condition }
      else
        format.html { render :edit }
        format.json { render json: @emergency_condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emergency_conditions/1
  # DELETE /emergency_conditions/1.json
  def destroy
    @emergency_condition.destroy
    respond_to do |format|
      format.html { redirect_to emergency_conditions_url, notice: 'Emergency condition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_emergency_condition
      @emergency_condition = EmergencyCondition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def emergency_condition_params
      params.fetch(:emergency_condition, {}).permit!
    end
end
