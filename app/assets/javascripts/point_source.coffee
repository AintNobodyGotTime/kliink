# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on('click', '.like', ( ->
  this.src="/assets/heart-points-selected2.jpg"
  $.ajax
     url: "/point_source/create"
     method: "post"
     data: user_id: current_user, project_id: project_id, source: "like", points: 1
     error: (jqXHR, textStatus, errorThrown) ->
       console.log "AJAX Error: #{textStatus} #{errorThrown}"
     success: (data, textStatus, jqXHR) ->
      refresh_point_total(1)
  )
)

$(document).on('click', '.share', ( ->
  $.ajax
     url: "/point_source/create"
     method: "post"
     data: user_id: current_user, project_id: project_id, source: "share", points: 4
     error: (jqXHR, textStatus, errorThrown) ->
       console.log "AJAX Error: #{textStatus} #{errorThrown}"
     success: (data, textStatus, jqXHR) ->
      refresh_point_total(4)
  )
)

$(document).on('click', '.donate', ( ->
  amount = $( 'input:checked' ).attr('id')
  $.ajax
     url: "/donation/create"
     method: "post"
     data: user_id: current_user, project_id: project_id, amount: amount
     error: (jqXHR, textStatus, errorThrown) ->
       console.log "AJAX Error: #{textStatus} #{errorThrown}"
     success: (data, textStatus, jqXHR) ->
      refresh_point_total(5 * amount)
  )
)

refresh_point_total = (points) ->
  old_total = $('#title_total_points').text()
  $('#title_total_points').text(points+parseInt(old_total))
