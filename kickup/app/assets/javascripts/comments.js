$(document).ready(function(){

  function Comment(json){
    this.userFirstName = json.user["first_name"]
    this.userLastName = json.user["last_name"]
    this.content = json.content
    this.userId = json["user_id"]
    this.id = json.id

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
})
