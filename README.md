# RETURN CALCULATOR

Rails app that calculate the return of the investmet made on a day in past and calculates the return
NAV values are fetched and stored in the database.

### Problem Description

Create a simple Front end form which takes date and invested amount as a parameter and computes the investment value as of today. For example, If Rs. 10,000 had been invested in Axis Long Term Equity Fund - Direct Plan on 13/May/2016, when the NAV value was 26.5481 then 376.67 units would have been purchased. That investment today would be worth Rs. 18544.97/- (on 12'th Jun For ex).

To achieve the above you would need to download the entire NAV history of a given fund. You can download complete NAV history of a mutual fund house from [here](http://portal.amfiindia.com/DownloadNAVHistoryReport_Po.aspx?mf=53&tp=1&frmdt=01-Apr-2015&todt=13-Jun-2019)
The URL above is for Axis Mutual fund.

Constraints

1. You can chose to work with only one Fund or one Fund house
2. Assume all investment happened after 01-Apr-2015.
3. See if you can provide XIRR of the investment. - [here](https://freefincal.com/what-is-xirr/)

Bonus Points

1. Allow me to add as many purchase records as I can for any date in past. It should show me my current value today.
2. Allow me to select different fund from a fixed fund house.

You can chose a database to store the information or you can use a simple text file to store the NAV's. The backend can be as simple as providing the information and the entire logic is in the frontend. Or the backend can do the heavy lifting and front end only shows the result.

If NAV of a particular date is not available, then the NAV of latest previous date is considered for the calculations

### Design decisions

- Assumption on selecting NAV - If NAV of a particular date is not available, then the NAV of latest previous date is considered.

- Basic validation to ensure investment creation to a scheme after the scheme creation date. As per problem description here it is restricted to 1st April 2015 also.

### Installation and setup

- Clone and run `bundle install` to install the depenedencie

- Change configurations in `config/database.yml`

- Run `rake db:setup` to do the initial setup and to load the navs

Features to Implement:

- Date picker
- Validation for scheme_name - DONE (at server side, ajax failed)
- validation at server side - DONE
- Searchable input for scheme selection
- Style changes - DONE
- xirr calculation - Check gem and install
- Deployment to heroku - DONE
- Rspec
- Documentation - In progress
- Error message for invaid output - DONE
- Flash messages - DONE
- Validations on input fields, to prevent negative and junk values - DONE at server side
