source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "active_storage_validations", "0.8.2"
gem "bcrypt", "3.1.15"
gem "bootsnap", ">= 1.4.2", require: false
gem "bootstrap-sass", "~> 3.4.1"
gem "bootstrap-will_paginate", "1.0.0"
gem "coffee-rails", "~> 5.0.0"
gem "config"
gem "faker"
gem "figaro"
gem "image_processing", "1.9.3"
gem "jquery-rails", "4.3.5"
gem "kaminari"
gem "kaminari-bootstrap"
gem "mini_magick", "4.9.5"
gem "mysql2"
gem "puma", "~> 3.7"
gem "rails", "~>6.0.2", ">= 6.0.2.2"
gem "rails-i18n"
gem "sass-rails", "~> 5.0"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"
gem 'jbuilder', github: 'rails/jbuilder', branch: 'master'
gem 'webpacker', "~> 4.0"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "capybara", ">= 2.15"
  gem "rubocop", "~> 0.54.0", require: false
  gem "selenium-webdriver"
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "web-console", ">= 3.3.0"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
