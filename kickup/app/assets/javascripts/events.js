$(function(){
  $("a.attendeesButton").on("click", function(e){
    e.preventDefault()
    const eventID = $(e.target).data("id")
    $.get("/events/" + eventID + "/rsvps", function(r){
      console.log(r)
    })
  })
})
