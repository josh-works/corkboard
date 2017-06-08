# Corkboard

1. Clone down with `git clone https://github.com/josh-works/corkboard.git`
2. Navigate to the project directory with `cd corkboard`
3. Run `bundle`
4. Run `rake db:{create,migrate,seed}` to get set up
5. To view locally, `rails s`, or pop it open in your fav editor

## Schema

If you'd like to see the schema:
1. Open and copy the contents of SchemaXML.txt
2. Save/Load, paste the contents, and "Load XML" at http://ondras.zarovi.cz/sql/demo/

## Notes
A few notes on the project:

- The Pro model is a single table inheritance from the User.

- Pro_Services exists to mark the difference between a user type of Pro and a user type of Requester (referred to a user).

- In Pro_Services there is a SET data type in the schema diagram (array w/integer in the DB). This is a non-indexed, unique value only array type that we are using to store an array of the service id's that are essentially tags noting what services that professional provides.   

----------------------------------------------------------------------------------

## Keys
Update application.yml with your own:
- Twilio
- Facebook
- Google
- Amazon AWS

----------------------------------------------------------------------------------

## Testing
This app is tested with RSpec and Capybara
