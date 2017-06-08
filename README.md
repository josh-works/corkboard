# README

Start by cloning down: git@github.com:NicholasJacques/corkboard.git

Navigate into the Corkboard directory in your terminal

Run the following commands:

Bundle
(utilizing "gem install -----" for any missing gems)

rake db:create
rake db:migrate
rake db:seed

(*you might need to enter an additional migration file*)
(*first check to see if column radius is present in the pro_services table in the schema*)
(*if it is not...*)

class AddColumnToProService < ActiveRecord::Migration[5.0]
  def change
    add_column :pro_services, :radius, :string
  end
end


Open the project in text editor of your choice

----------------------------------------------------------------------------------

In text editor open 'SchemaXML.txt'

In your web browser navigate to: http://ondras.zarovi.cz/sql/demo/

Click Save/Load

Paste the contents of SchemaXML into the Input/Output text field and hit "Load XML"

----------------------------------------------------------------------------------

A few notes on the project:

The Pro model is a single table inheritance from the User.

Pro_Services is utilized to deliniate the user type between a Requester(user) and Pro.

In Pro_Services there is a SET data type in the schema diagram (array w/integer in the DB). This is a non-indexed, unique value only array type that we are using to store an array of the service id's that are essentially tags noting what services that professional provides.   

----------------------------------------------------------------------------------

Keys:

Twilio

Facebook

Google

----------------------------------------------------------------------------------

API Endpoints:

"api/v1/projects/most_bid_project"
 This allows an authenticated request to view the project that has the highest number of bids associated with it.  It returns the description of the most bid upon project, the service being performed,  and the number of bids associated with it, and project's ID.
  { "id": null,
    "description": "i am 43 years old",
    "name": "Banjo Lessons",
    "project_id": 44,
    "count": 18}

"api/v1/projects/most_requested_project"
This allows an authenticated request to view the project that has been requested the most times.  It returns the service being performed, that service's ID and the number of times that it has been requested.
  { "id": null,
    "service_id": 233,
    "name": "Hip Hop Dance Lessons",
    "count": 5}
