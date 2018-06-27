$(document).ready(function(){

  function User(json){
    this.name = json.user["first_name"] + ' ' + json.user["last_name"]
    this.email = json.user["email"]

    this.addToPage = function(){
      $(".attendees").append("<p><strong>" + this.name + "</strong> - " + this.email + "</p>")
    }
  }
  $("#attendeesButton").on("click", function(e){
    e.preventDefault()
    $(".attendees").html("<h4>Members Attending</h4>")
    const eventID = $(e.target).data("id")
    $.getJSON("/events/" + eventID + "/rsvps", function(r){
      r.forEach(function(user){
      	thisUser = new User(user)
      	thisUser.addToPage()
      })
    })
  })
})
