# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

do ->
  $(window).on 'keypress', (ev) ->
    unless ev.target is $('input.try')[0]
      if (ev.which >= 65 && ev.which <= 90) || (ev.which >= 97 && ev.which <= 122)
        letter = String.fromCharCode(ev.keyCode)
        $("#form_#{letter.toUpperCase()}").submit()
