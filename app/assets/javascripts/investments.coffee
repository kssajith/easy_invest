# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  loadSchemes = (selected_date) ->
    $('#fund_id_select').empty()
    console.log(selected_date)

    data = {
      'date': selected_date
    }
    $.ajax({
      url: '/load_schemes',
      data: data,
      success: (result) ->
        console.log("done")
    });

  $('#investment_date_of_investing').on 'change', ->
    # loadSchemes($('#investment_date_of_investing').val())


# $ ->
#   $('#investment_date_of_investing').on 'change', ->
#     loadSchemes($('#investment_date_of_investing').val())
