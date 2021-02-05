# Shoppies API

An API to track users and nominations for Shoppies App.

### Tech Stack

- Ruby on Rails
- Postgres
- JWT gem

### Hosted with Heroku

https://shoppy-awards-api.herokuapp.com/

### Available Routes

POST /login

POST /users -> signup

GET /nominations -> protected route to retrieve user nominations resource

POST /nominations -> route to create/update nominations
## Get the Documentation On the Site

https://shoppy-awards-api.herokuapp.com/

## To Setup and Run This Project Locally

 Download or fork and clone the repository:

 https://github.com/afairlie/shoppies_api

 `unzip shoppies_api-master.zip`
 
 `mv shoppies_api-master ./<project_name>`

 OR

 `git clone <forked_repo> <project_name>`

 AND
 
 `cd <project_name>`

 Install project dependencies:

 `bundle install`

 Remove encrypted credentials (you can't use them because you don't have the master key):

 `rm ./config/credentials.yml.enc`

 `EDITOR=vim rails credentials:edit`

 Rails will generate a new master.key and credentials.yml.enc for you.

 JWT uses secret_key_base which is stored in your new credentials.yml.enc

 You must have Postgres installed locally. Instructions to install Postgres are outside the scope of this documentation.

 `rake db:setup`

 Create shoppies_api_development and shoppies_api_test databases

 `rails db:migrate`

 Run table migrations

 `rails db:seed`

 Seed data (two users and one nomination for testing)

 Run `rails s` to serve the api locally on port 3001

 Follow the instructions on the homepage of the site to test different routes!
