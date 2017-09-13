module ApplicationHelper
  def sequence(index)
    (@page.to_i - 1) * @page_size.to_i + index + 1
  end
end
