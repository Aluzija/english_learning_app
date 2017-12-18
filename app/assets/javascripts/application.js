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
  if (!(document.getElementById("disactivate") !== null && id === "how_many_form_rep")) {
    document.getElementById(id).style.display = 'block';
  }
}

function hide_form(object, event)
{
  var id = object.id;
  document.getElementById(id).style.display = 'none';
}

window.addEventListener("load", function() {
  var play = document.getElementById("autoplay");
  if (play != null) {
    play.onclick(event)
  }
});

window.addEventListener("load", function() {
  var button = document.getElementById("js_activation_button")
  button.addEventListener("click", function(event) {
    event.preventDefault();
  });
});

function check_type_1() {
  var answer = document.getElementById("answer");
  var guesses = document.getElementsByName("guess");
  var info = document.getElementById("feedback_info");
  var next_button = document.getElementsByClassName("next_after_check")[0];
  var correctness = document.getElementById("correctness");
  var after_guess_info = document.getElementById("after_guess")
  for(var i = 0; i < guesses.length; i++) {
    if(guesses[i].checked) {
      if(guesses[i].value === answer.value) { info.innerHTML = "Dobrze!"; correctness.value = true; }
      else { info.innerHTML = "Błąd. Poprawna odpowiedź: " + answer.value; correctness.value = false; }
    }
    after_guess_info.style.display = 'block';
    next_button.style.display = 'block';
    guesses[i].disabled = true;
  }
}

function check_type_2() {
  var answer = document.getElementById("answer");
  var guesses = document.getElementsByName("guess");
  var info = document.getElementById("feedback_info");
  var next_button = document.getElementsByClassName("next_after_check")[0];
  var correctness = document.getElementById("correctness");
  for(var i = 0; i < guesses.length; i++) {
    if(guesses[i].checked) {
      if(guesses[i].value === answer.value) { info.innerHTML = "Dobrze!"; correctness.value = true; }
      else { info.innerHTML = "Błąd. Poprawna odpowiedź: " + answer.value; correctness.value = false; }
    }
    next_button.style.display = 'block';
    guesses[i].disabled = true;
  }
}

function check_type_3() {
  var answer = document.getElementById("answer");
  var guesses = document.getElementsByName("guess");
  var info = document.getElementById("feedback_info");
  var next_button = document.getElementsByClassName("next_after_check")[0];
  var correctness = document.getElementById("correctness");
  for(var i = 0; i < guesses.length; i++) {
    if(guesses[i].checked) {
      responsiveVoice.speak(answer.value);
      if(guesses[i].value === answer.value) { info.innerHTML = "Dobrze!"; correctness.value = true; }
      else { info.innerHTML = "Błąd. Poprawna odpowiedź: " + answer.value; correctness.value = false; }
    }
    next_button.style.display = 'block';
    guesses[i].disabled = true;
  }
}

function check_type_4() {
  var answer = document.getElementById("answer");
  var guess = document.getElementById("guess");
  var info = document.getElementById("feedback_info");
  var next_button = document.getElementsByClassName("next_after_check")[0];
  var correctness = document.getElementById("correctness");
  if(guess.value === answer.value) { info.innerHTML = "Dobrze!"; correctness.value = true; }
  else { info.innerHTML = "Błąd. Poprawna odpowiedź: " + answer.value; correctness.value = false; }
  next_button.style.display = 'block';
}

function check_type_5() {
  var answer = document.getElementById("answer");
  var guess = document.getElementById("guess");
  var info = document.getElementById("feedback_info");
  var next_button = document.getElementsByClassName("next_after_check")[0];
  var correctness = document.getElementById("correctness");
  var sound_button = document.getElementById("hidden_sound");
  var check_button = document.getElementById("js_activation_button");
  if(guess.value === answer.value) { info.innerHTML = "Dobrze!"; correctness.value = true; }
  else { info.innerHTML = "Błąd. Poprawna odpowiedź: " + answer.value; correctness.value = false; }
  next_button.style.display = 'block';
  sound_button.style.display = 'block';
  sound_button.onclick(event);
  guess.disabled = true;
  check_button.disabled = true;
}

function disactivate() {
  var link = document.getElementById("repetition_button");
  link.href = "javascript: void(0)";
  link.style.color = '#c0c0c0';
}

window.addEventListener("load", function() {
  if (document.getElementById("disactivate") != null) { disactivate(); }
});




// window.addEventListener("load", function() {
//   document.addEventListener("click", check {
//
//   });
// });
