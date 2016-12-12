class Search < ApplicationRecord

  # def self.keywords_for(prefix)
  #   suggestions = where("keywords LIKE ?", "#{prefix}_%")
  #   suggestions.order("popularity desc").limit(10).pluck(:keywords)
  # end

  # def self.index_words
  #   Question.find_each do |question|
  #     keywords_for(question.content)
  #     question.content.split.each {|t| index_keywords(t)}
  #   end
  # end

  # def self.index_keywords(keywords)
  #   where(keywords: keywords.downcase).first_or_initialize.tap do |suggestion|
  #     suggestion.increment! :popularity
  #   end
  # end

  def search_words user
    words = Question.all
    words = words.where(["LOWER(content) LIKE ?", "%#{keywords}%"]) if keywords.present?
    if category.present?
      learned_ids = Learn.learned_ids(user.id, category)
      words = words.where(category_id: category)
      if learn
        words = words.where('id IN (?)', learned_ids)
      elsif !learned_ids.empty? && (learn == false) 
        words = words.question_not_learn(learned_ids)
      end
    else
      learned_ids = Learn.learned_ids_without_category(user.id)
      if learn
        words = words.where('id IN (?)', learned_ids)
      elsif !learned_ids.empty? && (learn == false) 
        words = words.question_not_learn(learned_ids)
      end
    end
    return words
  end
end
