# TTC Validator

TTC Validator is an API for generating and assigning 10 digit tokens based on the Luhn Algorithm.

It is built with Rails and Grape API

# Requirements

Build an API that validates and generates "Toronto Tech Company Tokens". TTC Tokens are values that can be validated by the Luhn Algorithm, with a few additional constraints. TTC Tokens are then assigned to a user.

The API should:

Allow a TTC Token to be validated - validate a given pattern/token even if not assigned
Allow a TTC Token to be generated
Allow user creation at which time a TTC token is assigned
Allow validation of a token for a given user
Include tests
Include documentation
Be deployed

TTC Token Constraints

Must be 10 digits
Starts with a 9
Successfully be validated by the Luhn Algorithm
Valid for 60 days

User Constraints

Unique by email
Capture name
Assigned TTC Token
Track all tokens ever assigned
Guidelines
Use Ruby On Rails. Show us you actually know it.
Use commits. The more the better to document your workflow.


## Routes
GET  |  https://ttc-tokens.herokuapp.com/api/v1/users                       |  v1  |  Return list of users                     
POST  |  https://ttc-tokens.herokuapp.com/api/v1/users {email: $, name: $}  |  v1  |  Add a user                               
GET  |  https://ttc-tokens.herokuapp.com/api/v1/users/:email                |  v1  |  Return a user                            
GET  |  https://ttc-tokens.herokuapp.com/api/v1/tokens/:token               |  v1  |  Validates a token                        
GET  |  https://ttc-tokens.herokuapp.com/api/v1/tokens                      |  v1  |  Return all tokens                        
GET  |  https://ttc-tokens.herokuapp.com/api/v1/tokens/:token/email/:email  |  v1  |  Validates if a token is assined to a user

## Helpful Links
[Trello (can provide access)](https://trello.com/b/GJ2smytj/ttc)

[Postman route collection](https://file.io/RaxUIPVwca7y)

## Stretch Goals
* Create React front end
* Refactor token generation
⋅⋅* Re-rolling until the token doesn't start with a 9 is... inelegant
* Add Swagger docs for routes
* Add Selenium tests for React front end
* Login / Account Mgmt / Security
* Cron to check expiry and remove tokens
* Ability to generate new tokens, after expiry
* Stub out data for rspec tests