# COMMAND

rake wh:make_table  => drop if exist and create tables in psql database

rake wh:populate:* => populate psql tables with data from mysql database 

* = quote, elevator, contact, customer, intervention

rake wh:reset => Does all the previous rake command in order

rake final:setup  => does rake db:reset and rake final:setup


# Week9
## Interventions
To create a new intervention you have to go into the backoffice and go to the interventions tab, then click on new intervention [or go to that link and login](http://rocketyenxm.site/admin/interventions/new)

[The file of the tab can also be found here](https://github.com/YenXm/Rocket-Elevators-Foundation/blob/master/app/admin/interventions.rb)

<br>

## Zendesk
When a new interventions is created, a new ticket should also be created in zendesk. All the the data that we want are enter in the field section of the ticket.

[Zendesk link](https://rocketelevator8423.zendesk.com/agent/)

<br>

## Bonus
### Bonus 1
All api are now working on personal key which cann all be found in the local_env.yml file in the server.

### Bonus 2
1. The first api that I implemented get monetary data. It is used [there](http://rocketyenxm.site/admin/exchange_rate). I first created a table with a list of currency gathered from one of the possible GET method of the api and the Calculate button does a call to the server which in return, call the api with both currency chosen and return the basic transfer rate which is use to calculate the result.
2. The second api is much more simple and only return a list of country name with their code(US, CA, FR) associated as a json. It was use to populate a new table.
3. With the previous list of country, the third api is use to get the covid stats by countries. IT work similarly as the first one.



