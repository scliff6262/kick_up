$(document).ready(function(){

  function Comment(json){
    this.userFirstName = json.user["first_name"]
    this.userLastName = json.user["last_name"]
    this.content = json.content
    this.userId = json["user_id"]
    this.id = json.id
    console.log(this)
    this.addToPage = function(){
      const template = $("#comment-template").html()
      const compiled = Handlebars.compile(template)
      const html = compiled(this)
      $("#comments").append(html)
    }
  }
  $("#viewComments").on("click", function(e){
    e.preventDefault()
    $("#comments").html("<h4>Comments:</h4>")
    const eventID = $(e.target).data("id")
    $.getJSON("/events/" + eventID + "/comments",function(r){
      r.forEach(function(comment){
        thisComment = new Comment(comment)
        thisComment.addToPage()
      })
      $("#form").css("display", "block")
    })
  })

  $(".new_comment").submit(function(e){
    e.preventDefault()
    const eventId = $(this).data("id")
    const commentData = $(this).serialize()
    $.ajax({
      type: "POST",
      url: `/events/${eventId}/comments`,
      data: commentData,
      dataType: "json",
      success: function(r){
        const thisComment = new Comment(r)
        $("#comment_content").val("")
        thisComment.addToPage()
      },
      error: function(){
        alert("Comment cannot be blank!")
      }
    })
  })
})
