# Specifications for the Rails with jQuery Assessment

Specs:
- [x] Use jQuery for implementing new requirements
jQuery is used in every event listener I created, and all functions are inside of a $(document.ready()) function
- [x] Include a show resource rendered using jQuery and an Active Model Serialization JSON backend.
On the User show page, a user can render details of an event they are attending through a "mini" event profile, rendered through AMS
- [x] Include an index resource rendered using jQuery and an Active Model Serialization JSON backend.
Users can access an index of other users attending a particular event on the event show page. "View Attendees" will render this index through AMS
- [x] Include at least one has_many relationship in information rendered via JSON and appended to the DOM.
There are 2. One from the previous example (Event has many Users) and also at the bottom of the event show page where a user can render a comment section and form for a particular event
- [x] Use your Rails API and a form to create a resource and render the response without a page refresh.
Users can add a comment to the event show page through JS, without a refresh
- [x] Translate JSON responses into js model objects.
All responses used js model objects, besides the function where an RSVP is created, because there is nothing rendered on the page, and only one reservation is being dealt with at a time.
- [x] At least one of the js model objects must have at least one method added by your code to the prototype.
There are js model objects in comment.js, user.js, and event.js and all of them have a similiar method added in order to properly append json responses to the page.

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
