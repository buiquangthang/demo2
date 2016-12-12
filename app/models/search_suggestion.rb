class SearchSuggestion < ApplicationRecord

  def self.terms_for(prefix)
    suggestions = where("term LIKE ?", "#{prefix}_%")
    suggestions.order("popularity desc").limit(10).pluck(:term)
  end

  def self.index_words
    Question.find_each do |question|
      index_term(question.content)
      question.content.split.each {|t| index_term(t)}
    end
  end

  def self.index_term(term)
    find_or_create_by(term: term.downcase).tap do |suggestion|
      suggestion.increment! :popularity
    end
  end
end
