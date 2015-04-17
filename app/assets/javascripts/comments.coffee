window.Academy={}

Academy.readAllComment = (userId, postId) ->
  $.ajax
    url: "/users/#{userId}/posts/#{postId}/comments/readall"
    type: 'PATCH'
    dataType: 'json'

Academy.initComment = ->
  $('.js-comment-edit').click ->
    $(@).closest('.user__comment-container').toggleClass('is-edit')

$ ->
  Academy.initComment()
