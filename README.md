# Worldpay tech test
This is a part of application process where I will create a simple RESTful service for merchants where they will be able to place offers.
## User stories
```
As a merchant I want to place an offer with description and price
```
```
As a merchant I want to place offer for certain period of time and have it expiring automatically
```
```
As a merchant I want to be able to cancel my offers at any time
```
```
As a merchant I want to be able to receive queries regarding to my offers
```
```
As a merchant I do not want to receive any queries for expired offers
```
## Approach
Considering my current experience and knowledge I decided to use Ruby as a programming language with Sinatra for RESTful routing and handling requests. I decided to store the data in postgreSQL database and deploy the project to Heroku.git

## Assumptions
So far there is no user authentication, verification. Web does not handle bad user input. Backend logic works well, but still working on front end and deployment

## How to run it
```
bundle
rake setup
rspec
rackup -p4567
enjoy it on localhost:4567
```
