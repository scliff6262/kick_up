# kickUp

Welcome to kickUp. This Ruby-on-Rails application will be used by people looking to organize and participate in pickup soccer games in their area.
Users will create a profile and will be exposed to a list of upcoming "kickup" games.
Users can view these events' profiles and choose to RSVP to these events, as well as open a discussion on the event page by adding a comment.
Event organizers can create events, and can view the list of users attending their event.


## Installation

First be sure to have Ruby installed. Download this repository, change directory to kick_up/kickup, and install the gems using 'bundle install'. Be sure to migrate the database using 'rake db:migrate'.

Start the server using the "bundle exec thin start --ssl" command to open the application with a 'https' certificate. In order for Omniauth to function properly, be sure the "Site URL" and the "Valid OAuth Redirect URIs" in the Facebook-Developers page match the current server.

## Video Walkthrough

https://www.youtube.com/watch?v=PSCDj4_ObVk&t=2s

## Demo

https://kickupsoccer.herokuapp.com/

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/scliff6262/kick_up. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
