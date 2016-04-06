class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  # GET /appointments
  # GET /appointments.json


 def index
  @clinic = Clinic.find(params[:clinic_id])
  @appointments = @clinic.appointments
 end

  def show
     @appointment = Appointment.find(params[:id])
     @clinic = Clinic.find(params[:clinic_id])


     @clinic = Clinic.find(@appointment.clinic)
  end

  # GET /appointments/new
  def new
   # @appointment = current_clinic.build
     @clinic = Clinic.find(params[:clinic_id])
     @appointment = @clinic.appointments.build
  end

  def create
    @clinic = Clinic.find(params[:clinic_id])
    @appointment = @clinic.appointments.create(appointment_params)
       if @appointment.save
      flash[:notice] = " Successfully created Appointment."
        redirect_to clinic_path (@appointment)
      end   
  end

   # GET /appointments/1/edit
  def edit
     @appointment = Appointment.find(params[:id])
     @clinic = Clinic.find(@appointment.clinic)
  end


  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
  def update
     @clinic = Clinic.find(params[:clinic_id])
     @appointment = @clinic.appointments.find(params[:id])
     if @appointment.update_attributes(appointment_params)
       flash[:notice] = "Successfully updated appointment."
        redirect_to appointment_url(@appointment)
     else
     render :action => 'edit'         
    end
  end

#{@subject.name}

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    @clinic = Clinic.find(params[:clinic_id])
    @appointment = @clinic.appointments.find(params[:id])
    @appointment.destroy
      flash[:notice] = "Successfully destroyed appointment ."
      redirect_to clinic_appointments_path
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params.require(:appointment).permit(:id, :clinic_id, :comment, :date, :creator)
    end
end
