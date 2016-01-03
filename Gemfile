source 'https://rubygems.org'

gem 'rails', "~> 5.0.0.beta"

# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views

# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Let's use the jquery turbolinks
gem 'jquery-turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
# Use PaperTrail for versioning
gem 'paper_trail', '~> 4.0.0'
# Use Pundit for authorization
gem 'pundit'
# Use Haml for templates
gem 'haml-rails', '~> 0.9'
# Use simple_form
gem 'simple_form'
# Use Foundation
gem 'foundation-rails'

# Use puma as the app server
gem 'puma', group: [:development, :production]

group :production do
  gem 'pg'
end

gem 'redcarpet'
gem 'pygments.rb'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  # We use RSpec for tests :D
  gem 'rspec-rails', '~> 3.0'
  # Use Factory Girl
  gem 'factory_girl_rails'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console'
  # We want prettier errors!
  gem 'better_errors'
  # Local mail delivery!
  gem 'letter_opener'
  # Deployment
  gem 'capistrano', require: false
  gem 'capistrano-rails',   require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano3-puma',   require: false
end
