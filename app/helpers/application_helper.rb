module ApplicationHelper
  # フルタイトルを返す
  def full_title(page_title = '')
    base_title = "医薬品情報管理システム"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
