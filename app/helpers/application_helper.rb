module ApplicationHelper
  def get_tags
    ActsAsTaggableOn::Tag.pluck(:name)
  end
end
