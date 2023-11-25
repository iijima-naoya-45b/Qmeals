# This is the ApplicationHelper module. It provides helper methods for the application.
module ApplicationHelper
  # Helper methods here
  def page_title(title = '')
    base_title = 'Qmeals'
    title.present? ? "#{title} | #{base_title}" : base_title
  end

  def default_meta_tags
    {
      site: 'Qmeals',
      title: '時短特化のレシピアプリ',
      reverse: true,
      charset: 'utf-8',
      description: 'Qmealsで、「時短」「手軽」に特化したサービスに触れて料理の幅を広げましょう〜!',
      keywords: '時短,手軽,料理,レシピ',
      canonical: request.original_url,
      separator: '|',
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('ogp.png'),
        local: 'ja-JP'
      }
    }
  end
end
