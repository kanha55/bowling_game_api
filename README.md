# README

This is a bowling game API built with Ruby on Rails.

## Setup

1. Ruby version: You need Ruby 2.7.0 or higher installed on your machine.

2. System dependencies: You need to have Rails 6.0.0 or higher and PostgreSQL installed.

3. Configuration: Clone this repository and run `bundle install` to install the necessary gems.

4. Database creation: Run `rails db:create` to create the database.

5. Database initialization: Run `rails db:migrate` to run the database migrations.

6. How to run the test suite: Run `bundle exec rspec` to run the tests.

## API Documentation

### Create a new game

- Endpoint: `POST /api/games`
- Response: The created game as JSON, including its frames.

### Get the score of a game

- Endpoint: `GET /api/games/:id/score`  # you can collect game id from /api/games api.
- Response: The game's total score and each frame's id and score as JSON.

### Roll a ball in a frame

- Endpoint: `POST /api/frames/:id/roll`  # you can collect frame id from /api/games api.
- Parameters: `pins` (the number of pins knocked down by the roll)
- Response: The created roll as JSON.

## Deployment instructions

This application is ready to be deployed on a platform like Heroku. Follow the platform's instructions for deploying a Ruby on Rails application.

## ...