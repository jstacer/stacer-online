source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# hoo boy!

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.2'
# Use Puma as the app server
gem 'puma', '~> 3.4'
# Use SCSS for stylesheets
gem 'sass-rails', '5.0.6'
# Bootstrap CSS classes
# gem 'bootstrap-sass', '~> 3.3.6'
# Social media button styles
# gem 'bootstrap-social-rails', '~> 4.8'
# create lightbox modals
# gem 'lightbox-bootstrap-rails', '5.1.0.1'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '~> 3.0.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# SSH methods
# gem 'net-ssh'
# another SSH kit, like net-ssh
# gem 'sshkit', '~> 1.7', '>= 1.7.1'
# SCP client protocol
# gem 'net-scp', '~> 1.2', '>= 1.2.1'
# IO classes for ssh
# gem 'ruby-termios', '~> 1.0', '>= 1.0.2'
# runs background processes
# gem 'sidekiq'
# DSL required by sidekiq
gem 'sinatra', github: 'sinatra'
gem 'rack-protection'
# config var protection
gem 'figaro'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Fonts!
gem 'font-awesome-rails', '~> 4.7', '>= 4.7.0.1'
gem 'font-awesome-sass'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'capistrano', '~> 3.4'
  gem 'capistrano-ssh-doctor', '~> 1.0'
end

group :test do
  gem 'rails-controller-testing', '0.1.1'
  gem 'minitest-reporters',       '1.1.9'
  gem 'guard',                    '2.13.0'
  gem 'guard-minitest',           '2.4.4'
end

group :production do
  gem 'pg', '0.18.4'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Specify ruby version
ruby "2.3.1"
