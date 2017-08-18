module ApplicationHelper
  def get_tags
    ActsAsTaggableOn::Tag.pluck(:name)
  end

  def show_projects(projects)
    if projects.present?
      projects.map{ |pr| render(partial: 'project_cell', locals: { project: pr }) }.join(' ')
    else
      content_tag(:div, class: 'col-xs-12') do
        content_tag(:span, "На даний момент таких проектів немає.")
      end
    end
  end
end
