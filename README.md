# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

> You need to have docker installed
 - more info: https://docs.docker.com/install/

* Configuration
  Once you have docker installed at the root folder build up the project's containers:
  Run:
  > docker-compose build

* Database creation

  run the command:

  > docker-compose run web rails db:create

  and then do not forget to run the migrations

  > docker-compose run web rails db:migrate

* Database and application initialization

  run the command:

  > docker-compose up

* How to run the test suite

  > docker-compose run web rspec
