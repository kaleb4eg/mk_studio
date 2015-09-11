class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: :show

  def index
    @pages = Page.all
  end

  def show
  end

  def new
    @page = Page.new
  end

  def edit
  end

  def create
    @page = Page.new(page_params)
    @page.save ? redirect_to(@page, notice: 'Page was successfully created.') : render(:new)
  end

  def update
    @page.update(page_params) ? redirect_to(@page, notice: 'Page was successfully updated.') : render(:edit)
  end

  def destroy
    @page.destroy
    redirect_to(pages_url, notice: 'Page was successfully destroyed.')
  end

  private
    def set_page
      @page = Page.find(params[:id])
    end

    def page_params
      params.require(:page).permit(:title, :description, :content)
    end
end
