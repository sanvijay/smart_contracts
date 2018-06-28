class DiagnosisCodesController < ApplicationController
  before_action :set_diagnosis_code, only: [:show, :edit, :update, :destroy]

  # GET /diagnosis_codes
  # GET /diagnosis_codes.json
  def index
    @diagnosis_codes = DiagnosisCode.all
  end

  # GET /diagnosis_codes/1
  # GET /diagnosis_codes/1.json
  def show
  end

  # GET /diagnosis_codes/new
  def new
    @diagnosis_code = DiagnosisCode.new
  end

  # GET /diagnosis_codes/1/edit
  def edit
  end

  # POST /diagnosis_codes
  # POST /diagnosis_codes.json
  def create
    @diagnosis_code = DiagnosisCode.new(diagnosis_code_params)

    respond_to do |format|
      if @diagnosis_code.save
        format.html { redirect_to @diagnosis_code, notice: 'Diagnosis code was successfully created.' }
        format.json { render :show, status: :created, location: @diagnosis_code }
      else
        format.html { render :new }
        format.json { render json: @diagnosis_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /diagnosis_codes/1
  # PATCH/PUT /diagnosis_codes/1.json
  def update
    respond_to do |format|
      if @diagnosis_code.update(diagnosis_code_params)
        format.html { redirect_to @diagnosis_code, notice: 'Diagnosis code was successfully updated.' }
        format.json { render :show, status: :ok, location: @diagnosis_code }
      else
        format.html { render :edit }
        format.json { render json: @diagnosis_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diagnosis_codes/1
  # DELETE /diagnosis_codes/1.json
  def destroy
    @diagnosis_code.destroy
    respond_to do |format|
      format.html { redirect_to diagnosis_codes_url, notice: 'Diagnosis code was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diagnosis_code
      @diagnosis_code = DiagnosisCode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def diagnosis_code_params
      params.require(:diagnosis_code).permit(:code, :short_desc, :long_desc)
    end
end
