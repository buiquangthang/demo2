$(document).on 'turbolinks:load', ->
  $('#search_keywords').autocomplete
    source: "/search_suggestions"
