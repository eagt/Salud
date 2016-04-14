class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  before_action :current_user
  protect_from_forgery with: :null_session  # Set to be able to delete appointments with null_session

 layout "professional"

 
  def index
    if params[:clinic_id]
      @appointments = @current_user.appointments.where(clinic_id: params[:clinic_id])
    elsif params[:professional_id]
      @appointments = @current_user.appointments        
    else
      @appointments = @current_user.appointments
    end    
  end


 # def index
 #  @clinic = Clinic.find(params[:clinic_id])
 #  @appointments = @clinic.appointments
 # end


  def show
    @appointment = Appointment.find(params[:id])
  end

  # def show
  #    @appointment = Appointment.find(params[:id])
  #    @clinic = Clinic.find(params[:clinic_id])


  #    @clinic = Clinic.find(@appointment.clinic)
  # end

  # GET /appointments/new

    def new
        @appointment = @current_user.appointments.new({:creator => @current_user.name})
        #redirect_to([@current_user, :appointments]) #--> latest change
    end
  
  # def new
  #  # @appointment = current_clinic.build
  #    @clinic = Clinic.find(params[:clinic_id])
  #    @appointment = @clinic.appointments.build
  # end

 

  def create
    # Instantiate a new object using form parameters
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      @current_user.appointments << @appointment
      # If save succeeds, redirect to the index action
      flash[:notice] = "Appointment #{@appointment.id} created successfully " 
      redirect_to([@current_user, :appointments]) 
    else
      # If save fails, redisplay the from so user can fix problems
      render('new') 
    end
  end


  # def create
  #   @clinic = Clinic.find(params[:clinic_id])
  #   @appointment = @clinic.appointments.create(appointment_params)
  #      if @appointment.save
  #     flash[:notice] = " Successfully created Appointment."
  #       redirect_to clinic_path (@appointment)
  #     end   
  # end

   # GET /appointments/1/edit

  def edit
   @appointment = Appointment.find(params[:id])
  end
  # def edit
  #    @appointment = Appointment.find(params[:id])
  #    @clinic = Clinic.find(@appointment.clinic)
  # end


  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json

   def update
    # Find and existing object using form parameters
    @appointment = Appointment.find(params[:id])
    # Update the object
    if @appointment.update_attributes(appointment_params)
      # If update succeeds, redirect to the index action
      flash[:notice] = " Appointment #{@appointment.id} updated successfully " 
      redirect_to([@current_user, @appointment])
    else
      # If save fails, redisplay the from so user can fix problems
      render('edit')
    end
  end


  # def update
  #    @clinic = Clinic.find(params[:clinic_id])
  #    @appointment = @clinic.appointments.find(params[:id])
  #    if @appointment.update_attributes(appointment_params)
  #      flash[:notice] = "Successfully updated appointment."
  #       redirect_to appointment_url(@appointment)
  #    else
  #    render :action => 'edit'         
  #   end
  # end

#{@subject.name}

  # DELETE /appointments/1
  # DELETE /appointments/1.json



  def delete
    @appointment = Appointment.find(params[:id])
  end

  def destroy
    appointment = Appointment.find(params[:id]).destroy
    flash[:notice] = " Appointment #{@appointment.id}  destroyed "
    redirect_to([@current_user, :appointments])
  end
  
  # def destroy
  #   @clinic = Clinic.find(params[:clinic_id])
  #   @appointment = @clinic.appointments.find(params[:id])
  #   @appointment.destroy
  #     flash[:notice] = "Successfully destroyed appointment ."
  #     redirect_to clinic_appointments_path
  # end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params.require(:appointment).permit(:id, :clinic_id, :comment, :date, :creator, assaignments_attributes: [:id, :professional_id, :creator, :_destroy])
    end
end
