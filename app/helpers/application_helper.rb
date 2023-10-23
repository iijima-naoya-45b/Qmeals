# This is the ApplicationHelper module. It provides helper methods for the application.
module ApplicationHelper
  # Helper methods here
  def page_title(title = '')
    base_title = 'Qmeals'
    title.present? ? "#{title} | #{base_title}" : base_title
  end
end
