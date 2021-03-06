class UploadProcessors::Null
  attr_reader :file

  def initialize(file)
    @file = file
  end

  def run
    Rails.logger.error "No upload strategy configured, unable to process #{file}"
    ActionController::Base.helpers.image_path("null-upload.png", digest: false)
  end
end
