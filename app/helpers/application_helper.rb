module ApplicationHelper
  # Retorna o título completo por página.
  def full_title(page_title = '')
    base_title = 'Aplicativo de amostra do tutorial Ruby on Rails'
    page_title.empty? ? base_title : page_title + ' | ' + base_title
  end
end
