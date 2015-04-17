Academy.readPost = (userId, postId) ->
  $.ajax
    url: "/users/#{userId}/posts/read?id=#{postId}"
    type: 'PATCH'
    dataType: 'json'

$ ->
  $('.js-post-edit').click ->
    $('.user__post-container').toggleClass('is-edit')
