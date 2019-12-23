# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load', ->
  $('#recipe_bg').hide();
  $('#recipe_delete_btn').click ->
    $('#recipe_bg').fadeIn 300
    return
  $('#close_btn').click ->
    $('#recipe_bg').fadeOut 300
    return
  return