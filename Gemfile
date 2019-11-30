source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.7'
gem 'mysql2'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

gem 'bootstrap'
gem "bootstrap4-datetime-picker-rails"
gem 'momentjs-rails'
gem 'jquery-rails'
gem 'devise'
gem 'devise-i18n'
gem 'devise-i18n-views'
gem 'rails-i18n', '~> 5.1'
gem 'haml-rails'
gem 'html2haml'
gem 'carrierwave'
gem 'rmagick'
gem 'font-awesome-sass'
gem 'faker'
gem 'gimei'
gem "gmaps4rails"
gem "geocoder"
gem 'kaminari'

group :production, :staging do
    gem 'unicorn', '5.4.1'
end

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'pry-doc'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
