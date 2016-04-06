class ClinicsController < ApplicationController
  before_action :set_clinic, only: [:show, :edit, :update, :destroy]
  before_action :current_user
  
  # Works for clinics on their own
  def index
    if @is_clinic
    @clinics = Clinic.all
   else 
    @clinics = @current_user.clinics
   end
  end

# Works for clinics on their own
  def show
     @clinic = Clinic.find(params[:id])
  end


# Works for clinics on their own
 def new
      if !@is_clinic # If the user is a professional and is creating a new clinic
         @clinic = @current_user.clinics.new(:creator => "Professional")
      else # kicks in when registering a new Clinic
         @clinic = Clinic.new(:creator => "Clinic")
      end   
   end

 # Works for clinics on their own
   def create               
    # Instantiate a new object using form parameters
    @clinic = Clinic.new(clinic_params)
    if @clinic.save
      if !@is_clinic then Employment.create(:clinic => @clinic, :professional => @current_user, :creator => "Professional") end
      # If save succeeds, redirect to the index action     
      flash[:notice] = "Clinic #{@clinic.name} created"
      redirect_to([@current_user, :clinics])   
    else
      # If save fails, redisplay the from so user can fix problems
      render('new')
    end 
  end

# Works for clinics on their own
 def edit
    @clinic = Clinic.find(params[:id])
  end

# Works for clinics on their own
  def update
    # Find and existing object using form parameters
    @clinic = Clinic.find(params[:id])
    # Update the object
    if @clinic.update_attributes(clinic_params)
      # If update succeeds, redirect to the index action
      flash[:notice] = "Clinic #{@clinic.name} upadated. "
      redirect_to([@current_user, @clinic])
    else
      # If save fails, redisplay the from so user can fix problems
      render('edit')
    end
  end
 
# Works for clinics on their own
  def delete
    @clinic = Clinic.find(params[:id])
  end

# Works for clinics on their own
  def destroy
    clinic = Clinic.find(params[:id]).destroy
    flash[:notice] = " CLinic '#{@clinic.name} destroyed successfully. "
    redirect_to([@current_user, :clinics])
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clinic
      @clinic = Clinic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def clinic_params
      params.require(:clinic).permit(:id, :creator, :name)
    end
end

