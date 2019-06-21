# EASY INVEST - CHECK YOUR RETURNS

Rails app that calculate the return of the investmet made on a day in past and calculates the return
NAV values are fetched and stored in the database.

If NAV of a particular date is not available, then the NAV of latest previous date is considered for the calculations

### Initial Setup

- Install ruby version : ruby-2.5.3
- Clone and run `bundle install` to install the depenedencies

#### Database creation

Postgresql is used as the databse.

Rename config/database.yml.example to config/database.yml

Run `rake db:setup` to do the initial setup

Features to Implement:

- Date picker
- Validation to the date field
- validation at server side
- Searchable input for scheme selection
- style changes - DONE
- xirr calculation
- deployment to heroku
- rspec
- documentation
- error message for invaid output
