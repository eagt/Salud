class AssaigmentsController < ApplicationController
  before_action :set_assaigment, only: [:show, :edit, :update, :destroy]

 layout "professional"
 
  def index
    @assaigments = Assaigment.all
  end

  # GET /assaigments/1
  # GET /assaigments/1.json
  def show
  end

  # GET /assaigments/new
  def new
    @assaigment = Assaigment.new
  end

  # GET /assaigments/1/edit
  def edit
  end

  # POST /assaigments
  # POST /assaigments.json
  def create
    @assaigment = Assaigment.new(assaigment_params)

    respond_to do |format|
      if @assaigment.save
        format.html { redirect_to @assaigment, notice: 'Assaigment was successfully created.' }
        format.json { render :show, status: :created, location: @assaigment }
      else
        format.html { render :new }
        format.json { render json: @assaigment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assaigments/1
  # PATCH/PUT /assaigments/1.json
  def update
    respond_to do |format|
      if @assaigment.update(assaigment_params)
        format.html { redirect_to @assaigment, notice: 'Assaigment was successfully updated.' }
        format.json { render :show, status: :ok, location: @assaigment }
      else
        format.html { render :edit }
        format.json { render json: @assaigment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assaigments/1
  # DELETE /assaigments/1.json
  def destroy
    @assaigment.destroy
    respond_to do |format|
      format.html { redirect_to assaigments_url, notice: 'Assaigment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assaigment
      @assaigment = Assaigment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assaigment_params
      params.require(:assaigment).permit(:appointment_id, :professional_id, :creator)
    end
end
