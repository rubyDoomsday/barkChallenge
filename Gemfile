source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.8'
gem 'rails', '~> 6.1.7', '>= 6.1.7.6'

gem "bootsnap", ">= 1.4.4", require: false
gem 'bcrypt', '~> 3.1.7'
gem "jbuilder", "~> 2.7"
gem "net-http"
gem "puma", "~> 5.0"
gem "sass-rails", ">= 6"
gem "sqlite3", "~> 1.4"
gem "turbolinks", "~> 5"
gem "uri"
gem 'simple_form', '~> 5.3'

group :development, :test do
  gem "parallel_tests", "~> 2.29", ">= 2.29.2"
  gem "pry-byebug", "~> 3.7"
  gem "rspec-rails", "~> 4.1.0", ">= 3.8.2"
end

group :development do
  gem "listen", "~> 3.3"
  gem "rack-mini-profiler", "~> 2.0"
  gem "rubocop", "~> 0.79.0", require: false
  gem "spring"
  gem "spring-commands-parallel-tests"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 4.1.0"
end

group :test do
  gem "capybara", ">= 3.26"
  gem "factory_bot_rails"
  gem "faker", "~> 2.1"
  gem "selenium-webdriver"
  gem "shoulda-matchers", "~> 4.2"
  gem "simplecov", "~> 0.17.0", require: false
  gem "webdrivers"
end
