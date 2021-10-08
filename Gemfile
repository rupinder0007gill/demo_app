source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

# Reduces boot times through caching; required in config/boot.rb
# Read more: https://github.com/Shopify/bootsnap
gem 'bootsnap', '~> 1.9', '>= 1.9.1'

# Simple authorization solution for Rails. All permissions are stored in a single location.
# Read more: https://github.com/CanCanCommunity/cancancan
gem 'cancancan', '~> 3.3'

# Flexible authentication solution for Rails with Warden
# Read more: https://github.com/heartcombo/devise
gem 'devise', '~> 4.8'

# Allows marking ActiveRecord objects as discarded,
# and provides scopes for filtering.
# Read more: https://rubygems.org/gems/discard
gem 'discard', '~> 1.2'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.11', '>= 2.11.2'

# Presenting names of people in full, familiar, abbreviated, and initialized forms
# Read more: https://github.com/basecamp/name_of_person
gem 'name_of_person', '~> 1.1', '>= 1.1.1'

# Use postgresql as the database for Active Record
# Read more: http://deveiate.org/code/pg/
gem 'pg', '~> 1.2', '>= 1.2.3'

# Use Puma as the app server
# Read more: http://puma.io/
gem 'puma', '~> 5.5'

# Ruby on Rails is a full-stack web framework optimized for programmer
# happiness and sustainable productivity. It encourages beautiful code by
# favoring convention over configuration.
# Read more: http://rubyonrails.org/
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.1.4', '>= 6.1.4.1'

# Roles library without any authorization enforcement
# Read more: https://github.com/RolifyCommunity/rolify
gem 'rolify', '~> 6.0'

# Use SCSS for stylesheets
# Read more: https://github.com/rails/sass-rails
gem 'sass-rails', '~> 6.0'

# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
# Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.4', '>= 5.4.3'

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
# Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5.2', '>= 5.2.1'

group :development, :test do
  # help to kill N+1 queries and unused eager loading
  # Read more: https://github.com/flyerhzm/bullet
  gem 'bullet', '~> 6.1', '>= 6.1.5'

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'listen', '~> 3.7'
  gem 'rack-mini-profiler', '~> 2.3', '>= 2.3.3'
  # Automatic Ruby code style checking tool
  # Read more: https://docs.rubocop.org/
  gem 'rubocop', '~> 1.22', '>= 1.22.1'
  gem 'rubocop-performance', '~> 1.11', '>= 1.11.5'
  gem 'rubocop-rails', '~> 2.12', '>= 2.12.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '~> 3.0'
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
