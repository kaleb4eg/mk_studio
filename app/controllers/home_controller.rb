class HomeController < ApplicationController
  def index
    @page = Page.where(title: 'Home page').first
  end

  def project
    @project = Page.find(params[:id])
  end

  def projects
    @commercial_projects = Page.tagged_with('project commercial')
    @privat_projects = Page.tagged_with('project privat')
    @finished_projects = Page.tagged_with('project finished')
  end
end
