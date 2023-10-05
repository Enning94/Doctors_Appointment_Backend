class Api::V1::AppointmentsController < ApplicationController
  before_action :authenticate_user
  before_action :set_appointment, only: %i[show update destroy]

  # GET /appointments
  def index
    @appointments = Appointment.where(user_id: current_user.id)
    render json: @appointments
  end

  # GET /appointments/1
  def show
    render json: @appointment
  end

  # POST /appointments
  def create
    @appointment = Appointment.new(appointment_params)

    if @appointment.save
      render json: 'Appointment created successfully ✅', status: :created
    else
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /appointments/1
  def destroy
    if @appointment.destroy
      render json: 'Appointment deleted successfully ✅ ', status: :created
    else
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def appointment_params
    permitted_params = params.require(:appointment).permit(:doctor_id, :appointment_date, :city, :appointment_duration)

    # Set the user_id to the current user's id
    permitted_params[:user_id] = current_user.id

    permitted_params
  end
end
