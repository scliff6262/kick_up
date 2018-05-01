# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes)
  ~User has many comments
- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
  ~Comment belongs to Event
- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
  ~Event has many Users through RSVPS
- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
  ~A user can add a note/comment to their RSVP
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
  ~User, Event, and Comment classes all contain validations
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
  ~User#organized_events will show the events that specific user created/organized URL: /users/:id
- [x] Include signup (how e.g. Devise)
  ~created logic in 'users#new'
- [x] Include login (how e.g. Devise)
  ~created logic using bcrypt
- [ ] Include logout (how e.g. Devise)
  ~'sessions#destroy' clears session hash
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
  ~Facebook/OmniAuth
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
  ~Event organizer can view the events' attendees at URL: events/:event_id/rsvps
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients)
  ~RSVP is created and User can add a comment at URL: events/:event_id/rsvps/new
- [x] Include form display of validation errors (form URL e.g. /recipes/new)
  ~Event and User forms display validation errors and uses '.field_with_errors' to highlight fields with errors

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
