class Admin::PageImagesController < Admin::AdminController
  before_filter :find_page_image, only: [:edit, :update, :destroy]
  before_filter :set_page, only: [:new, :create, :edit, :update]
  layout 'modal_actions'

  def new
    @page_image = @page.page_images.build
  end

  def create
    @page_image = PageImage.new(page_image_params.merge(page_id: params[:page_id]))
    @page_image.save ? render('create') : render('new')
  end

  def edit
  end

  def update
    @page_image.update(page_image_params)
    @page_image.save ? render('update') : render('edit')
  end

  def destroy
    @page_image.destroy
  end

  def sort
    PageImage.find(params[:id]).insert_at(params[:position].to_i + 1)
    render nothing: true
  end

  private

  def find_page_image
    @page_image = PageImage.find(params[:id]) if params[:id]
  end

  def set_page
    @page = Page.find(params[:page_id])
  end

  def page_image_params
    params.require(:page_image).permit(:title, :description, :file)
  end
end
