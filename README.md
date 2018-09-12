# Todo App

TodoApp is a simple Rails application that allows you:
 - create a task with description and status of "completed" or "uncompleted"
 - mark task as completed
 - view tasks list (completed & uncompleted)

This documents the steps that are necessary to get the application up and running on your machine

## Prerequisites

You're going to need:

  - Linux or OS X — Windows may work, but I'm not sure as this instruction is for Linux or OS X
  - Ruby `version 2.5.1`
  - Database - `postgreSQL`
  - Bundler — If Ruby is already installed, but the bundle command doesn't work, just run gem install bundler in a terminal.

## Getting Set Up

  1. Clone the repository
```
$ git clone git@github.com:esteedqueen/todoapp.git
$ cd todoapp

```
  2. Run setup to install the gems configurations and setup the database.

```
$ bin/setup

```

  3. Run rails server

```
$ rails s

```

## How to run the test suite
  Run `rake` or `rspec` to run the full tests specs

```
$ rspec

OR

$ rake

```