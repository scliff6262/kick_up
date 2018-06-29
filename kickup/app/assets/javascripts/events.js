$(document).ready(function(){

  function User(json){
    this.name = json.user["first_name"] + ' ' + json.user["last_name"]
    this.email = json.user["email"]
    this.id = json.user["id"]

    this.addToPage = function(){
      $(".attendees").append(`<p><a href="/users/${this.id}">${this.name}</a> - <a href="mailto:${this.email}">Send Email</a> </p>`)
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

  $("#attend-link").on("click", function(e){
    e.preventDefault()
    const eventID = $(e.target).data("event-id")
    if (this.text === "Attend this Kickup"){
      $.ajax({
        type: "POST",
        url: `/events/${eventID}/rsvps`,
        data: {"event_id": eventID},
        dataType: "json",
        success: function(r){
          let count = parseInt(document.getElementById("attendees-count").innerHTML)
          $("#attendees-count").text(`${count + 1}`)
          $("#attend-link").text("Cancel RSVP").attr("data-rsvp-id", r.id)
        },
        error: function(){
        }
      })
    }
    else if(this.text === "Cancel RSVP"){
      let rsvpID = $(this).data("rsvp-id")
      $.ajax({
        type: "DELETE",
        url: `/events/${eventID}/rsvps/${rsvpID}`,
        data: {},
        dataType: "html",
        success: function(r){
          let count = parseInt(document.getElementById("attendees-count").innerHTML)
          $("#attendees-count").text(`${count - 1}`)
          $("#attend-link").text("Attend this Kickup")
        },
        error: function(){
          alert("Please do not rapidly create and delete your reservation.")
        }
      })
    }
  })
})
