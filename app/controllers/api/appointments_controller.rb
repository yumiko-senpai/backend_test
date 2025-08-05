class Api::AppointmentsController < ApplicationController

  def index
    @appointments = current_customer.appointments.includes(:service)
    render json: @appointments, include: [:service]
  end

  def show
    @appointment = current_customer.appointments.find(params[:id])
    render json: @appointment, include: [:service]
  end

  def create
    @appointment = current_customer.appointments.new(appointment_params)
    if @appointment.save
      render json: @appointment, status: :created, include: [:service]
    else
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end

  def update
    @appointment = current_customer.appointments.find(params[:id])
    if @appointment.update(appointment_params)
      render json: @appointment, include: [:service]
    else
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @appointment = current_customer.appointments.find(params[:id])
    @appointment.destroy
    head :no_content
  end

  private
  def appointment_params
    params.require(:appointment).permit(:date, :time, :status, :service_id)
  end
end

