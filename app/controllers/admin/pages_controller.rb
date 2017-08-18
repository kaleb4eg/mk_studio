class Admin::PagesController < Admin::AdminController
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  def index
    @page_type = params['page_type'].present? ? params['page_type'] : 'page'
    @pages = case @page_type
    when 'project'
      Page.project
    else
      Page.page
    end
  end

  def show
  end

  def new
    @page = Page.new(page_type: Page.page_types.keys.include?(params['page_type']) ? params['page_type'] : 'page')
  end

  def edit
  end

  def create
    @page = Page.new(page_params)
    @page.tag_list = params[:tags_list]
    @page.save ? redirect_to(admin_page_url(@page), notice: "#{@page.page_type} was successfully created.") : render(:new)
  end

  def update
    @page.tag_list = params[:tags_list]
    @page.update(page_params) ? redirect_to(admin_page_url(@page), notice: "#{@page.page_type} was successfully updated.") : render(:edit)
  end

  def destroy
    page_type = @page.page_type
    @page.destroy
    redirect_to(admin_pages_url(page_type: page_type), notice: "#{page_type} was successfully destroyed.")
  end

  private
    def set_page
      @page = Page.find(params[:id])
    end

    def page_params
      params.require(:page).permit(:title, :description, :content, :page_type)
    end
end
