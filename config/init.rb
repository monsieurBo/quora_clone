# Specify gemfile Location and general variables

ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

puts ENV['BUNDLE_GEMFILE']

# Perform requiring gem that we need

######################################################################

# basic

require 'rubygems'

require 'bundler/setup' if File.exist?(ENV['BUNDLE_GEMFILE'])

require 'pathname'

require 'pg'

require 'active_record'

require 'sinatra'

require 'sinatra/cookies'

require 'bcrypt'

require 'byebug'

configure do
  enable :sessions unless test?
  set :session_secret, "secret"
end

APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))

set :views, File.join(APP_ROOT, "views")
set :erb, layout: :'application'

require APP_ROOT.join('config', 'database')

Dir[APP_ROOT.join('controllers', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('helpers', '*.rb')].each { |file| require file }