$ ->
  $('#comment_body').keyup ->
    $('#char_num').text($(this).val().length)
