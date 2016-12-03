module CategoriesHelper
  def quantity_of_question(category_id)
    Category.find(category_id).questions.count
  end
end
