# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

group :development do
  gem "bundler", "~> 1.15"
  gem "rake", "~> 12.1"
  gem "rubocop", "~> 0.49"
end

group :plugins do
  gem "vagrant-trellis-cert", path: "."
end
