module ApplicationHelper

  def full_title(page_title)
    base_title = "厦门馨窝网"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
end
