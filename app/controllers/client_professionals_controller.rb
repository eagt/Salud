class ClientProfessionalsController < ApplicationController
  before_action :set_client_professional, only: [:show, :edit, :update, :destroy]

  # GET /client_professionals
  def index
    @client_professionals = ClientProfessional.all
  end

  # GET /client_professionals/1
  def show
  end

  # GET /client_professionals/new
  def new
    @client_professional = ClientProfessional.new
  end

  # GET /client_professionals/1/edit
  def edit
  end

  # POST /client_professionals
  def create
    @client_professional = ClientProfessional.new(client_professional_params)

    if @client_professional.save
      redirect_to @client_professional, notice: 'Client professional was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /client_professionals/1
  def update
    if @client_professional.update(client_professional_params)
      redirect_to @client_professional, notice: 'Client professional was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /client_professionals/1
  def destroy
    @client_professional.destroy
    redirect_to client_professionals_url, notice: 'Client professional was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client_professional
      @client_professional = ClientProfessional.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def client_professional_params
      params.require(:client_professional).permit(:professional_id, :client_id, :name, :creator)
    end
end
