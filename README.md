## gemoria [![Build Status](https://travis-ci.org/RaimundSchramm/gemoria.png?branch=master)](https://travis-ci.org/RaimundSchramm/gemoria)

everything that comes to mind

### About
This project started as a simple ToDo-app inspired by [this great Railscast](http://railscasts.com/episodes/136-jquery-ajax-revised).

Quickly it became my favourite tool to guide my agile software development practice as a replacement for a fully-featured alternative as a ticket system like Redmine, as a scrum tool like PivotalTracker or even as the issues and wiki here on github.

It is a work in progress. It focusses on the task at hand of agile development, provides the important basic tools and workflows in an easy way and adds more complex features as desired.

### System dependencies
- git
- Ruby 2.1.5
- Javascript-Runtime-Environment, for example nodejs
- bundler
- postgres for production
- phantomjs

### Installation
Get the code.
`git clone https://github.com/RaimundSchramm/gemoria.git`

Install the gems.
`cd path-to-gemoria && bundle`

Set up the database.
`rake db:setup`

Run the tests with Rake or RSpec to see if everything is fine.
`rake` or `rspec`
