class HomeController < ApplicationController
  def index
    @page = Page.send(params[:page_title]).last
  end

  def project
    @project = Page.find(params[:id])
  end

  def projects
    @projects = Page.project.order(created_at: :desc).includes(:page_images)

    @projects = case params[:project_type]
    when 'commercial'
      @projects.tagged_with('project commercial')
    when 'private'
      @projects.tagged_with('project privat')
    when 'finished'
      @projects.tagged_with('project finished')
    else
      @projects
    end

    @projects
  end
end
