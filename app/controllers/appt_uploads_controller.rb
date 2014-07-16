class ApptUploadsController < ApplicationController
  before_action :set_appt_upload, only: [:show, :edit, :update, :destroy]

  # GET /appt_uploads
  # GET /appt_uploads.json
  def index
    @appt_uploads = ApptUpload.all
  end

  # GET /appt_uploads/1
  # GET /appt_uploads/1.json
  def show
  end

  # GET /appt_uploads/new
  def new
    @appt_upload = ApptUpload.new
  end

  # GET /appt_uploads/1/edit
  def edit
  end

  # POST /appt_uploads
  # POST /appt_uploads.json
  def create
    @appt_upload = ApptUpload.new(appt_upload_params)

    respond_to do |format|
      if @appt_upload.save
        format.html { redirect_to @appt_upload, notice: 'Appt upload was successfully created.' }
        format.json { render action: 'show', status: :created, location: @appt_upload }
      else
        format.html { render action: 'new' }
        format.json { render json: @appt_upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appt_uploads/1
  # PATCH/PUT /appt_uploads/1.json
  def update
    respond_to do |format|
      if @appt_upload.update(appt_upload_params)
        format.html { redirect_to @appt_upload, notice: 'Appt upload was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @appt_upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appt_uploads/1
  # DELETE /appt_uploads/1.json
  def destroy
    @appt_upload.destroy
    respond_to do |format|
      format.html { redirect_to appt_uploads_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appt_upload
      @appt_upload = ApptUpload.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appt_upload_params
      params.require(:appt_upload).permit(:process_start_time, :process_end_time, :content)
    end
end
