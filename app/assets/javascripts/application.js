// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs

//= require jquery3
//= require popper
//= require bootstrap-sprockets

//= require_tree .
window.addEventListener("load", function() {
  var links = document.getElementsByClassName("show_or_hide_form");
  for (var i = 0; i < links.length; i++) {
    links[i].addEventListener("click", function(event) {
      event.preventDefault();
    });
  }
});

function show_form(object)
{
  var id = object.id;
  document.getElementById(id).style.display = 'block';
}

function hide_form(object, event)
{
  var id = object.id;
  document.getElementById(id).style.display = 'none';
}

window.addEventListener("load", function() {
  var play = document.getElementById("autoplay");
  play.onclick(event)
});
