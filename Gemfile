source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails'
gem 'pg'
gem 'puma'
gem 'bcrypt'

group :development, :test do
  gem 'rspec-rails'
end

group :development do
  gem 'pry-rails'
  gem 'listen'
end