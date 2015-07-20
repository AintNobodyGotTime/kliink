# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on('click', '.like', ( ->
  this.src="assets/heart-points-selected2.jpg"
  $.ajax
     url: "/point_source/create"
     method: "post"
     data: user_id: current_user, project_id: project_id, source: "like", points: 1
     error: (jqXHR, textStatus, errorThrown) ->
       console.log "AJAX Error: #{textStatus} #{errorThrown}"
     success: (data, textStatus, jqXHR) ->
       $('body').append "Successful AJAX call: #{data}"
  )
  refresh_point_total
)

$(document).on('click', '.share', ( ->
  $.ajax
     url: "/point_source/create"
     method: "post"
     data: user_id: current_user, project_id: project_id, source: "share", points: 4
     error: (jqXHR, textStatus, errorThrown) ->
       console.log "AJAX Error: #{textStatus} #{errorThrown}"
     success: (data, textStatus, jqXHR) ->
       $('body').append "Successful AJAX call: #{data}"
  )
  refresh_point_total
)

$(document).on('click', '.donate', ( ->
  amount = this.data.amount
  $.ajax
     url: "/donation/create"
     method: "post"
     data: user_id: current_user, project_id: project_id, source: "donate", amount: amount
     error: (jqXHR, textStatus, errorThrown) ->
       console.log "AJAX Error: #{textStatus} #{errorThrown}"
     success: (data, textStatus, jqXHR) ->
       $('body').append "Successful AJAX call: #{data}"
  )
  refresh_point_total
)

#refresh_point_total = () ->
