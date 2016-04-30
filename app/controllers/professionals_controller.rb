class ProfessionalsController < ApplicationController
  before_action :set_professional, only: [:show, :edit, :update, :destroy]
  before_action :current_user

   layout "professional"

  # def login
  #   render layout: false
  # end

  def index
    if @is_clinic # If the user is a Clinic
      @professionals = @current_user.professionals
    else # If the user is professional pass the whole list ONLY for testing
      @professionals = Professional.all
    end
  end

  def show
    @professional = Professional.find(params[:id])
  end

  def new    
      if @is_clinic # If the user is a clinic and is creating a new  professional
         @professional = @current_user.professionals.new(:creator => @current_user.name)
      else # kicks in when registering a new Professional
        @professional = Professional.new(:creator => "Self")
      end    
  end

  def create        
    # Instantiate a new object using form parameters
    @professional = Professional.new(professional_params)
    if @professional.save
      # THIS ONE IS WORKING PROPERLY ...   if @is_clinic then Employment.create(:clinic => @current_user, :professional => @professional, :creator => "Clinic") end
       if @is_clinic then Employment.create(:clinic => @current_user, :professional => @professional, :creator => "@current_user") end
      # If save succeeds, redirect to the index action
      flash[:notice] = "Professional #{@professional.name} created "
      redirect_to([@current_user, :professionals]) 
      else
      # If save fails, redisplay the form so user can fix problems
      render('new')
      end
  end

  def edit
    @professional = Professional.find(params[:id])
  end

  def update
    # Find and existing object using form parameters
    @professional = Professional.find(params[:id])
    # Update the object
    if @professional.update_attributes(professional_params)
      # If update succeeds, redirect to the index action
      flash[:notice] = "#{@professional.name} updated successfully "
      redirect_to([@current_user, @professional])
    else
      # If save fails, redisplay the from so user can fix problems
      render('edit')
    end
  end

  def delete
    @professional = Professional.find(params[:id])
  end

  def destroy
    professional = Professional.find(params[:id]).destroy
    flash[:notice] = "Professional #{@professional.name} destroyed successfully. "
    redirect_to([@current_user, :professionals])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_professional
      @professional = Professional.find(params[:id])
    end

    #  def set_locale
    #   I18n.locale = params[:locale] || I18n.default_locale
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def professional_params
      params.require(:professional).permit(:id, :creator, :name)
    end
end







