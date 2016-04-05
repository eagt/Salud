class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  def index
    @appointments = Appointment.all
    #@clinic = Clinic.find(params[:clinic_id])
    #@appointments = @clinic.appointments.all
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def new
    @clinic = Clinic.find(params[:clinic_id])
    @appointment = @clinic.appointments.build
  end

  def create
      @clinic = Clinic.find(params[:clinic_id])
      @appointment = @clinic.appointments.create(appointment_params)
      if @appointment.save
         flash[:notice] = " Successfully created Appointment."
         redirect_to clinic_path(@appointment)
       end
    end

  # def create
  #   @clinic = Clinic.find(params[:clinic_id])
  #   @appointment = @clinic.appointments.build(appointment_params)
  #     if @appointment.save
  #       flash[:notice] = " Successfully created Appointment."
  #       redirect_to(clinic_appointments_url)
  #     else
  #       render action: :new
  #     end
  # end

  def edit
  end

  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to @appointments, notice: 'Appointment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    def appointment_params
      params.require(:appointment).permit(:clinic_id, :comment, :date, :creator)
    end
end
