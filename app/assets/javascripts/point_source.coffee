# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(".like").click ->
  $.ajax
     url: "/point_source/create"
     data: user_id: current_user.id, project_id: @project_id, source: "like", points: 1
     error: (jqXHR, textStatus, errorThrown) ->
       console.log "AJAX Error: #{textStatus}"
     success: (data, textStatus, jqXHR) ->
       $('body').append "Successful AJAX call: #{data}"

$(".share").click ->
  $.ajax
     url: "/point_source/create"
     data: user_id: current_user.id, project_id: project_id, source: "share", points: 3
     error: (jqXHR, textStatus, errorThrown) ->
       console.log "AJAX Error: #{textStatus}"
     success: (data, textStatus, jqXHR) ->
       $('body').append "Successful AJAX call: #{data}"