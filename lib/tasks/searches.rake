namespace :searches do
  desc "Generate search suggesstions from Questions"
  task index: :environment do
    binding.pry
    SearchSuggestion.index_words
  end
end
