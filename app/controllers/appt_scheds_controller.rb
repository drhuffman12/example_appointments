class ApptSchedsController < ApplicationController
  before_action :set_appt_sched, only: [:show, :edit, :update, :destroy]

  # GET /appt_scheds
  # GET /appt_scheds.json
  def index
    @appt_scheds = ApptSched.all
  end

  # GET /appt_scheds/1
  # GET /appt_scheds/1.json
  def show
  end

  # GET /appt_scheds/new
  def new
    @appt_sched = ApptSched.new
  end

  # GET /appt_scheds/1/edit
  def edit
  end

  # POST /appt_scheds
  # POST /appt_scheds.json
  def create
    @appt_sched = ApptSched.new(appt_sched_params)

    respond_to do |format|
      if @appt_sched.save
        format.html { redirect_to @appt_sched, notice: 'Appt sched was successfully created.' }
        format.json { render action: 'show', status: :created, location: @appt_sched }
      else
        format.html { render action: 'new' }
        format.json { render json: @appt_sched.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appt_scheds/1
  # PATCH/PUT /appt_scheds/1.json
  def update
    respond_to do |format|
      if @appt_sched.update(appt_sched_params)
        format.html { redirect_to @appt_sched, notice: 'Appt sched was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @appt_sched.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appt_scheds/1
  # DELETE /appt_scheds/1.json
  def destroy
    @appt_sched.destroy
    respond_to do |format|
      format.html { redirect_to appt_scheds_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appt_sched
      @appt_sched = ApptSched.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appt_sched_params
      params.require(:appt_sched).permit(:start_time, :end_time, :first_name, :last_name, :comments)
    end
end
