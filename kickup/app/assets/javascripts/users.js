$(document).ready(function(){

  function Event(json){
    this.title = json.title
    this.date = json.date
    this.eventTime = json.event_time
    this.id = json.id

    this.addToPage = function(){
      const template = $("#event-template").html()
      let compiled = Handlebars.compile(template)
      let html = compiled(this)
      debugger;
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
