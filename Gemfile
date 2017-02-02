source 'http://rubygems.org'

ruby '2.3.0'

gem 'rails',          '5.0.0.1'
#gem 'bootstrap-sass', '3.3.6'   # Add boostrap
gem 'puma',           '3.4.0'   # Used as app server
gem 'sass-rails',     '5.0.6'   # Use SCSS for stylesheets
gem 'uglifier',       '3.0.0'   # Used as compressor for JavaScript assets
gem 'coffee-rails',   '4.2.1'   # Used for .coffee assets and views
gem 'jquery-rails',   '4.1.1'   # Use as the JavaScript library
gem 'turbolinks',     '5.0.1'   # Makes navigating your web application faster
gem 'jquery-turbolinks'
gem 'jbuilder',       '2.4.1'   # Build JSON APIs with ease.
gem 'bcrypt',         '3.1.11'  # Use ActiveModel has_secure_password
gem 'slim-rails'
gem 'faker',          '1.6.3'
gem 'figaro'
gem 'local_time'
gem 'font-awesome-rails'
gem 'ckeditor', github: 'galetahub/ckeditor'
gem 'paperclip', git: "https://github.com/thoughtbot/paperclip.git"
gem 'carmen-rails', '~> 1.0.0'
gem 'country_select', '~> 2.5', '>= 2.5.2'
gem 'active_link_to'
gem 'select2-rails'
gem 'bootstrap-datepicker-rails', '~> 1.6', '>= 1.6.1.1'
gem 'social-share-button'
gem 'acts-as-taggable-on'
gem "acts_as_follower", github: "tcocca/acts_as_follower"
gem 'will_paginate', '~> 3.1.0'
gem "will_paginate_semantic_ui"
gem 'sanitize', '~> 4.0', '>= 4.0.1'

# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'sqlite3',  '1.3.11'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug',   '9.0.0', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console',           '3.1.1'
  gem 'listen',                '3.0.8'
  # Spring speeds up development by keeping your application running in the background.
  gem 'spring',                '1.7.2'
  gem 'spring-watcher-listen', '2.0.0'
end

group :test do
  gem 'rails-controller-testing', '0.1.1'
  gem 'minitest-reporters',       '1.1.9'
  gem 'guard',                    '2.13.0'
  gem 'guard-minitest',           '2.4.4'
end

group :production do
  gem 'pg', '0.18.4'
  gem 'rails_12factor'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
