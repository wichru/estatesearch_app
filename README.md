# Dog Breed Fetcher

[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

Welcome to Dog Breed Fetcher! This application lets you input a dog breed and fetches an image of a dog of that breed asynchronously, displaying it right next to the input form.

## Features
1. **Breed Input**: Text input field labeled "Breed" for users to enter the dog breed.
2. **Image Fetching**: Fetches a dog breed image from the Dog API.
3. **Async Display**: Utilizes Turbo to handle form submission and display the image asynchronously.

### Tech

Dog Breed Fetcher is built with the following technologies:

* [Ruby 3.2.1]
* [Rails 7]
* [Turbo && Stimulus] - For handling form submission asynchronously.
* [Slim] - Slim templates for cleaner views.
* [RSpec && Capybara] - Rspec tests && Capybara feature tests.
* [Rubocop] - Ruby static code analyzer

### Setup and Installation

To set up the Dog Breed Fetcher on your local machine:

```sh
$ cd estatesearch_app
$ bundle install
$ yarn install
```

### Running the Application

```sh
$ cd estatesearch_app
$ bin/dev
```

### Tests && code coverage

```sh
$ cd estatesearch_app
$ rspec spec
$ open coverage/index.html
```

### Usage

Upon loading the webpage, you'll see:

1. **Text Input**: A text input field labeled "Breed" where you can type the name of the dog breed.
2. **Submit Button**: Clicking this button fetches and displays an image of the entered dog breed asynchronously.

### Demo app

You can find a demo app deployed on Fly.io [here](https://dark-bird-5069.fly.dev/)
