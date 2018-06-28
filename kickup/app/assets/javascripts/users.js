$(document).ready(function(){

  function Event(jsonEvent){
    this.title = jsonEvent.title
    this.date = jsonEvent.date
    this.eventTime = jsonEvent.event_time
    this.id = jsonEvent.id
    this.address = jsonEvent.address

    this.addToPage = function(){
      const template = $("#event-template").html()
      let compiled = Handlebars.compile(template)
      let html = compiled(this)
      $("#selectedEvent").html(html)
    }
  }
  $(".my-events").on("click", function(e){
    e.preventDefault()
    const eventID = $(e.target).data("id")
    $.getJSON(`/events/${eventID}`, function(r){
      const thisEvent = new Event(r)
      thisEvent.addToPage()
    })
  })
})
