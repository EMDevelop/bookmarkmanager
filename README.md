## Bookmark Manager

### Intro

This project will allow users to interact with Bookmarks on the website. It will include:

- Show a list of bookmarks
- Add new bookmarks
- Delete bookmarks
- Update bookmarks
- Comment on bookmarks
- Tag bookmarks into categories
- Filter bookmarks by tag
- Users are restricted to manage only their own bookmarks

### User Story / Domain Model

```
As a User
So that I can see which bookmarks exist
I want to see a list of bookmarks
```

`Bookmark`
|attributes|methods |
|----------|---------|
| name: String | |
| description: String | |

`BookmarkManager`
|attributes|methods |
|----------|---------|
| bookmarks: Array | list_bookmarks() |
| | |

### setting up a Sinatra project

- Decide on a project name `bookmark_manager`
- Initialize git
  - `git --init`
- Create a readme `touch README.md`
- Create Git repository through Git GUI
- Update local repository to point to new origin
  - `git remote add origin https://github.com/EMDevelop/bookmarkmanager.git`
- Initial push
  - `git add .`
  - `git commit -m "First Commit"`
- Initialise Rspec
  - run `rspec --init`
  - create a `feature` folder within the `spec` folder
  - create a `lib` folder for your model
- Setup the App folder
  - `mkdir app`
  - `cd app` and `touch app.rb`
  - `mkdir views`
  - `cd views` and `touch index.erb`
- Create gemfile
  - `bundle init`
  - Remove the git source line
  - Add Gems
    - sinatra
    - sinatra-reloader
    - rspec
    - capybara
    - rubocop
    - thin
    - simplecov
    - simplecov-console
  - run `bundle install`
- create your `app.rb` code
  - require `sinatra/base` and `sinatra/reloader`
  - create a child class of `Sinatra::Base` to form the entry point of your application.
  - include boiler plate code for reloader
  - Add a root route (/)
- Create a `config.ru`
  - Require your `app.rb`
  - `run xx` xx will be the child class of sinatra::base in app.rb
- Configure `rubocop`
  - Create a `.rubocop.yml` file
  - Use these pre-configured settings

```
inherit_from:
  - https://raw.githubusercontent.com/makersacademy/scaffolint/v2.2.0/.rubocop.yml
```

- Configure the `spec_helper`
  - require all items needed

```
require 'simplecov'
require 'simplecov-console'
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require_relative '../app/app'
require_relative './feature/helper'      # Optional
```

- Configure `capybara`
  - Make sure you replace the `.app` to your child class from app.rb

```
Capybara.configure do |config|
  config.run_server = false
  config.server = :webrick
  config.default_driver = :selenium
  config.app = BookmarkManager
  config.app_host = "localhost:9292"
end
```

- Configure `SimpleCov`

```
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
])
SimpleCov.start
```
