module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "Ruby on Rails Tutorial Sample App"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def learned?(question_id, category_id)
    learned_ids = Learn.learned_ids(current_user, category_id)
    learned_ids.include? question_id
  end
end
