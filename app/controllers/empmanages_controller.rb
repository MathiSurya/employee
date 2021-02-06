class EmpmanagesController < ApplicationController
  before_action :set_empmanage, only: %i[ show edit update destroy ]

  # GET /empmanages or /empmanages.json
  def index
    @empmanages = Empmanage.all
  end

  # GET /empmanages/1 or /empmanages/1.json
  def show
  end

  # GET /empmanages/new
  def new
    @empmanage = Empmanage.new
  end

  # GET /empmanages/1/edit
  def edit
  end

  # POST /empmanages or /empmanages.json
  def create
    @empmanage = Empmanage.new(empmanage_params)

    respond_to do |format|
      if @empmanage.save
        format.html { redirect_to @empmanage, notice: "Empmanage was successfully created." }
        format.json { render :show, status: :created, location: @empmanage }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @empmanage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /empmanages/1 or /empmanages/1.json
  def update
    respond_to do |format|
      if @empmanage.update(empmanage_params)
        format.html { redirect_to @empmanage, notice: "Empmanage was successfully updated." }
        format.json { render :show, status: :ok, location: @empmanage }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @empmanage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /empmanages/1 or /empmanages/1.json
  def destroy
    @empmanage.destroy
    respond_to do |format|
      format.html { redirect_to empmanages_url, notice: "Empmanage was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empmanage
      @empmanage = Empmanage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def empmanage_params
      params.require(:empmanage).permit(:first_name, :last_name, :age, :gender, :designation)
    end
end
