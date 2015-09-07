class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: :show

  def index
    @pages = Page.all
  end

  def show
  end

  # GET /pages/new
  def new
    @page = Page.new
  end

  # GET /pages/1/edit
  def edit
  end

  # POST /pages
  def create
    @page = Page.new(page_params)
    @page.save ? redirect_to(@page, notice: 'Page was successfully created.') : render(:new)
  end

  # PATCH/PUT /pages/1
  def update
    @page.update(page_params) ? redirect_to(@page, notice: 'Page was successfully updated.') : render(:edit)
  end

  # DELETE /pages/1
  def destroy
    @page.destroy
    redirect_to(pages_url, notice: 'Page was successfully destroyed.')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:title, :description, :content)
    end
end
