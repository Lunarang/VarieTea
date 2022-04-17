# README

VarieTea is a complete Ruby on Rails application that manages related data through complex forms and RESTful routes. The goal of the application is to build a Content Management System that allows the user to:

* Explore a database of teas contributed by many users
* Find teas by ingredient and/or benefit
* Track teas that the user has already tried
* Add teas to a list of favorites
* Earn badges as they use the app
* Create their own tea blends to share with others
* Sign up for an account with their email, or sign in using GitHub

## Install

### Clone the repository

```shell
git clone git@github.com:Lunarang/VarieTea.git
cd project
```

### Check your Ruby version

```shell
ruby -v
```

The ouput should start with something like `ruby 2.6.1`

If not, install the right ruby version using [rbenv](https://github.com/rbenv/rbenv) (it could take a while):

```shell
rbenv install 2.6.1
```

### Install dependencies

Using [Bundler](https://github.com/bundler/bundler) and [Yarn](https://github.com/yarnpkg/yarn):

```shell
bundle && yarn
```

### Initialize the database

```shell
rails db:create db:migrate db:seed
```

## Serve

```shell
rails s
```
Navigate your web browser to http://127.0.0.1:3000/ to get started!

## Architecture and Models

VarieTea follows basic MVC architecture and RESTful controller conventions.
Models and associations are as follows:

* User - has many Badges and Teas
* Badge - belongs to User
* Tea - belongs to User, has many Users, Benefits, and Ingredients through join tables
* Benefit - has many Teas through join table
* Ingredient - has many Teas through join table
