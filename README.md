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

---

### How To Run

#### program

#### database

- We've used two postgres DB's
- Connect to `psql`
- Create 2 databases
  - `bookmark_manager`
  - `bookmark_manager_test`
- In both databases run
  - SQL found in file: `01_create_bookmarks_table.sql`

### User Story / Domain Model

```
As a User
So that I can see which bookmarks exist
I want to see a list of bookmarks
```

```
As a time-pressed user
So that I can save a website
I would like to add the site's address and title to bookmark manager
```

```
As a user
So that I can keep track of a new website
I would like to add bookmarks
```

`Bookmark`
|attributes|methods |
|----------|---------|
| address: String | |
| title: String | |

`BookmarkManager`
|attributes|methods |
|----------|---------|
| bookmarks: Array | list_bookmarks() |
| | store_bookmark()|

---

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
require_relative './feature/feature'

```

set up the behaviour of rack (the Ruby Library that underpins Sinatra)

```
ENV['RACK_ENV'] = 'test'
```

- Configure `capybara`

```
require 'dotenv'

Dotenv.load

ENV['RACK_ENV'] = 'test'
Capybara.app = BookmarkManager

```

- Configure `SimpleCov`

```
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
])
SimpleCov.start
```

- There is an option to use gem `rspec-sinatra`

  - This will let you do... `rspec-sinatra init <Class name> <path where app is>` e.g.
  - `rspec-sinatra init BookmarkManager app/app.rb`

- Write a feature test

```
describe 'User Interface', type: :feature do

  context 'I want to see a list of bookmarks' do

    it 'shows bookmarks' do
      visit('/bookmarks')
      expect(page).to have_content("bookmark")
    end

  end

end
```
