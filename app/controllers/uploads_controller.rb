class UploadsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_upload, only: [:show, :edit, :update, :destroy]

  # GET /uploads
  def index
    page = params.permit(:page)[:page]
    @uploads = Upload.where(user: current_user).page page
  end

  # GET /uploads/1
  def show
  end

  # GET /uploads/new
  def new
    @upload = Upload.new
  end

  # POST /uploads
  def create
    file = params[:file] || params[:upload][:file]
    @upload = Upload.create_with_file file, current_user

    respond_to do |format|
      if @upload.save
        @message = "Upload was successfully created."
        format.html { redirect_to @upload, notice: @message }
        format.json { render :show, status: :ok, location: @upload }
      else
        @message = "Error uploading: #{@upload.errors}"
        format.html { render :new }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uploads/1
  def destroy
    @upload.destroy
    respond_to do |format|
      format.html { redirect_to uploads_url, notice: 'Upload was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_upload
      @upload = Upload.where(user: current_user).find(params[:id])
    end

end
