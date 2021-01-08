# Shoppies API

An API to track users and nominations for Shoppies App.

Built with a Token authorization flow, using JWT.

### Hosted with Heroku

https://shoppy-awards-api.herokuapp.com/

### Available Routes

POST /login

POST /users -> signup

GET /nominations -> protected route to retrieve user nominations resource
POST /nominations -> route to update nominations (TODO: be able to add nominations if you have none)

### In Development
bin/rails -s
