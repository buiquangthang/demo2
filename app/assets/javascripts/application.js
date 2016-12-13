// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .

function startTimer(duration, displayMinute, displaySecond) {
  var timer = duration,
  displayMinute, displaySecond;
  var timeIntervalID = setInterval(function () {
    minutes = parseInt(timer / 60, 10)    
    seconds = parseInt(timer % 60, 10);   
    minutes = minutes < 10 ? "0" + minutes : minutes;    
    seconds = seconds < 10 ? "0" + seconds : seconds;    
    displayMinute.textContent = minutes;    
    displaySecond.textContent = seconds;
    if (--timer < -1) {     
      timer = 0;  
      displaySecond.textContent = "00";      
      if (timer == 0) {    
        clearInterval(timeIntervalID);        
        alert(jQuery('.timeout_message_show').text());
        $("#new_lesson").submit();        
      }      
    }    
  }, 1000);  
};

$(function() {
  $(".pagination a").on("click", function() {
    $(".pagination").html("Page is loading...");
    $.getScript(this.href);
    return false;
  });
});

$(document).on('turbolinks:load', function() {
  return $('#search_keywords').autocomplete({
    source: "/search_suggestions"
  });
})
