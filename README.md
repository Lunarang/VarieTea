![varietea](https://user-images.githubusercontent.com/63659148/192602888-0c922592-71fb-4fe8-91bf-2144d7e35898.jpg)

VarieTea is a complete Ruby on Rails application that manages related data through complex forms and RESTful routes. The goal of the application is to build a Content Management System that allows the user to:

* Explore a database of teas contributed by many users
* Find teas by ingredient and/or benefit
* Track teas that the user has already tried
* Add teas to a list of favorites
* Earn badges as they use the app
* Create their own tea blends to share with others
* Sign up for an account with their email, or sign in using GitHub

</br>
<b>Curious about this project?</b>  

:eyes: Watch the video [demo](https://vimeo.com/702151475)  
:books: Read about the process on my [blog](https://codebaby.hashnode.dev/my-first-rails-project-varietea)  

## Install :sparkles:

### Prerequesites
Before you begin, ensure you have met the following requirements:

* You have installed `ruby 2.6.1` or higher.
* You have a Linux or WSL environment.
* You have Ruby on Rails installed.

### Clone the repository

```shell
git clone git@github.com:Lunarang/VarieTea.git
cd VarieTea
```

### Install api dependencies

Using [Bundler](https://github.com/bundler/bundler):

```shell
bundle install
```

### Initialize the database

```shell
rails db:create db:migrate db:seed
```

## Serve :sparkles:

```shell
rails s
```

Then navigate to your [local host](http://localhost:3000/) to start using the app!

## Architecture and Models :sparkles:

VarieTea follows basic MVC architecture and RESTful controller conventions.
Models and associations are as follows:

* <b>User</b> `has_many` badges and teas
* <b>Badge</b> `belongs_to` user
* <b>Tea</b> `belongs_to` user, `has_many` users, benefits, and ingredients through join tables
* <b>Benefit</b> `has_many` teas through join table
* <b>Ingredient</b> `has_many` teas through join table

## Contributions :sparkles:

This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/lunarang/VarieTea/CODE_OF_CONDUCT.md).
To contribute to VarieTea, follow these steps:

1. Fork this repository.
2. Create a branch: `git checkout -b <branch_name>`.
3. Make your changes and commit them: `git commit -m '<commit_message>'`
4. Push to the original branch: `git push origin <project_name>/<location>`
5. Create the pull request.

Alternatively see the GitHub documentation on [creating a pull request](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request).

## License :sparkles:

The repository is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct :sparkles:

Everyone interacting in this project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/lunarang/VarieTea/CODE_OF_CONDUCT.md).

![varietea (1)](https://user-images.githubusercontent.com/63659148/192603029-7e2fed7d-3f12-4d9a-be0c-4bd7c9b2929b.png)
