# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#follow_bg').hide()
  $('#following_delete_btn').click ->
    $('#follow_bg').fadeIn 300
    return
  $('#follow_close_btn').click ->
    $('#follow_bg').fadeOut 300
    return
  return