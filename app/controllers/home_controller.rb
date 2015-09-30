class HomeController < ApplicationController
  def index
    @page = Page.first
  end
end
