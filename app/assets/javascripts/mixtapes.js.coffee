$(document).ready ->
  audioSection = undefined
  audioSection = $('section#audio')
  $('a.html5').click (e) ->
    e.preventDefault()
    audio = undefined
    url = undefined
    audio = $('<audio>', controls: 'controls')
    url = $(this).attr('href')
    $('<source>').attr('src', url).appendTo audio
    audioSection.html audio
    false
  return
