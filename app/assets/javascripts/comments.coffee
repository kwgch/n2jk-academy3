window.Academy={}
Academy.initComment = ->
  $('.js-comment-edit').click ->
    $(@).closest('.user__comment-container').toggleClass('is-edit')

$ ->
  Academy.initComment()
