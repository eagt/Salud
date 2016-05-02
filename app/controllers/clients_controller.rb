class ClientsController < ApplicationController
   before_action :set_client, only: [:show, :edit, :update, :destroy]
  before_action :current_user
  protect_from_forgery with: :null_session  # Set to be able to delete appointments with null_session
  

 layout "professional"

 
 def index
  if @is_clinic && params[:professional_id] 
    @clients = Professional.find(params[:professional_id]).clients.where(clinic_id: params[:clinic_id])
    
  elsif !@is_clinic && params[:clinic_id] 
    @clients = @current_user.clients.where(clinic_id: params[:clinic_id])
  else
     @clients = @current_user.clients
  end
 end



  def show
    @client = Client.find(params[:id])
  end



    def new 
      #@appointment = @current_user.appointments.new({:creator => @current_user.name})
       @client = @current_user.clients.new({:creator => @current_user.name})
    end
  
  def create
    begin
        @client = Client.create(client_params)
       @current_user.clients << @client    
       flash[:notice] = "Client #{@client.id} created successfully " 
       redirect_to([@current_user, :clients]) 
      rescue Exception => e # Catch exceptions      
      @client = @current_user.clients.new(client_params)
      flash[:notice] = " Can't be added. " +  e.to_s 
      render ("new")
    end
  end

 def edit
   @client = Client.find(params[:id])
  end

  # PATCH/PUT /clients/1
  def update
    # Find and existing object using form parameters
    @client = Client.find(params[:id])
    # Update the object
    if @client.update_attributes(client_params)
      # If update succeeds, redirect to the index action
      flash[:notice] = " Client #{@client.id} updated successfully " 
      redirect_to([@current_user, @client])
    else
      # If save fails, redisplay the from so user can fix problems
      render('edit')
    end
  end


 def delete
    @client = Client.find(params[:id])
  end

  def destroy
    client = Client.find(params[:id]).destroy
    flash[:notice] = " Client #{@client.id}  destroyed "
    redirect_to([@current_user, :clients])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def client_params
      params.require(:client).permit(:clinic_id, :name, :creator, client_profesionals_attributes: [:id, :professional_id, :creator, :_destroy])
    end
end
