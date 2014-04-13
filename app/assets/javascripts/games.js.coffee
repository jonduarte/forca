# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

do ->
  $(window).on 'keydown', (ev) ->
    if ev.which >= 65 && ev.which <= 90
      letter = String.fromCharCode(ev.keyCode)
      $("#form_#{letter}").submit()
