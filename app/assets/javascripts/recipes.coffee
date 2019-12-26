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
  
$(document).on 'turbolinks:load', ->
  $('#follow_bg').hide();
  $('#following_delete_btn').click ->
    $('#follow_bg').fadeIn 300
    return
  $('#follow_close_btn').click ->
    $('#follow_bg').fadeOut 300
    return
  return
  
# $win = $(window)
# $win.on 'turbolinks:load', ->
#   windowWidth = window.innerWidth
#   if window.matchMedia('(max-width:1000px)').matches
#     $(document).on 'turbolinks:load', ->
#       $('.header-menus').hide();
#       $('#toggle_bar').click ->
#         $('#header_nav').css 'height', '415px'
#         $('.header-menus').stop().slideToggle 200
#         return
#       return
#   return
# $(document).on 'turbolinks:load', ->
#   $('.header-menus').hide();
#   $('#toggle_bar').click ->
#     $('#header_nav').css 'height', '415px'
#     $('.header-menus').stop().slideToggle 200
#     return
#   return