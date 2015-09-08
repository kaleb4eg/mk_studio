class TinymceAssetsController < ApplicationController
  before_filter :authenticate_user!

  def create
    image = TinymceImage.new
    image.file = params[:file]
    if image.save
      render json: { image: { url: image.file.url } }, content_type: 'text/html'
    else
      render json: { error: { message: 'Invalid file type. Only .jpg, .png and .gif allowed' } }, content_type: 'text/html'
    end
  end
end
