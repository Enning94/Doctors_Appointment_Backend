class Api::V1::DoctorsController < ApplicationController
  # before_action :authenticate_user
  before_action :set_doctor, only: %i[show update destroy]

  # GET /doctors
  def index
    @doctors = Doctor.all
    render json: @doctors
  end

  # GET /doctors/1
  def show
    render json: @doctor
  end

  # POST /doctors

  def create
    authorize! :create, Doctor
    @doctor = Doctor.new(doctor_params)

    if @doctor.save
      render json: { message: 'Doctor successfully created✅', doctor: @doctor }, status: :created
    else
      render json: @doctor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /doctors/1
  def destroy
    authorize! :destroy, @doctor
    if @doctor.destroy
      render json: 'Doctor successfully deleted❌', status: :created
    else
      render json: @doctor.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_doctor
    @doctor = Doctor.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def doctor_params
    params.require(:doctor).permit(:name, :profile_pic, :bio, :specialization, :consultation_fee)
  end
end
