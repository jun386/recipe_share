# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$('.menu-trigger').on 'click', ->
  if $(this).hasClass('active')
    $(this).removeClass 'active'
    $('.header-menus').slideUp()
  else
    $(this).addClass 'active'
    $('.header-menus').slideDown()
  return